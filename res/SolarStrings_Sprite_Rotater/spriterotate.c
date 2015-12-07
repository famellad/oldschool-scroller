#include <SDL/SDL.h>
#include <SDL/SDL_image.h>
#include "IMG_savepng.h"
#include "gfx.h"
#include "scale2x.h"
#include "dirent.h"
#include "font.h"
#include "scandir.h"

char image_filename[255];       //the image we open for rotating
char output_filename[255];      //the image output filename
char only_filename[255];        //only the filename (no path included)

double angles[] = {0, 22.5, 30, 45, 60, 67.5, 90, 112.5, 120, 135, 150, 157.5, 180, 202.5, 210, 225, 240, 247.5, 270, 292.5, 300, 315, 330, 337.5};
int pressed = FALSE;
int global_index = 0;

void Init_SDL()
{
	FILE *out;  //file pointer
	int i=0;

	//Initialize SDL
	if (SDL_Init(SDL_INIT_VIDEO) != 0) {

			//open error.txt if we failed
			out = fopen( "video_error.txt", "w" );

			if( out != NULL )
			{
				//report what went wrong
				fprintf(out,"Could not initialize SDL: %s\n", SDL_GetError());

				//close the file
				fclose(out);
			}

        //exit the program
		exit(1);
	}

	//make sure we close down SDL at exit
	atexit(SDL_Quit);

	screen=SDL_SetVideoMode(640,480,32,SDL_HWSURFACE);

		//if creating the screen surface failed
		if (screen == NULL) {

			//open error.txt
			out = fopen( "video_error.txt", "w" );

			if( out != NULL )
			{
				//report what went wrong
				fprintf(out,"Could not set video mode: %s\n", SDL_GetError());

				//close the file
				fclose(out);
			}

            //exit program
			exit(1);
		}

    Create_tripple_buffer(640,480);

    for(i=0;i<NUM_CHARACTERS;i++)
    {
        cleanfont_space[i] = 8;
    }
}

int Select_Image_To_Load(void)
{
int done=0;
struct dirent **filelist = {0};
char *directory = "rotateme";
char filename[80];
int file_counter = -1;
int i = 0;
int text_xpos=0;
int text_ypos=34;
int selectbox_x=0,selectbox_y=0;
int filenumber=-1;
int Mousex=0,Mousey=0;

SDL_Rect 	Rect_Mouse,
            Rect_Close;


//create an event
SDL_Event event;

Setup_Rectangle(&Rect_Close,576,0,64,32);

//get how many files there are in the directory
file_counter = scandir(directory, &filelist, 0, alphasort);

	//if there are no files
	if(file_counter < 0) {

		//return 0
		return 0;
	}

	//load the top bar
	TempImage = Load_And_Convert_Bitmap("data/topbar.png");

	while(!done)
	{

		//uppdate mouse position
        SDL_GetMouseState(&Mousex,&Mousey);

		//update the mouse rectangle
		Setup_Rectangle(&Rect_Mouse,Mousex,Mousey,1,1);

		//update where the little box is on screen
		selectbox_x = (Mousex/156)*156;
		selectbox_y = 3 + (Mousey/10)*10;

		while ( SDL_PollEvent(&event) )
		{

			switch (event.type)
			{
					case SDL_KEYUP:
					{

					}break;

				//if a mousebutton was released
				case SDL_MOUSEBUTTONUP:
				{
					//if it was the left one
					if( event.button.button == SDL_BUTTON_LEFT )
					{
						//if the user pressed the close button
						if(SDL_CollideBoundingBox(Rect_Close,Rect_Mouse))
						{
							//end the loop
							done=1;
							return 0;
						}

						//make sure the mouse is not on an illegal post
						if(Mousey>34 && Mousey<469 && Mousex<623)
						{
							//if the file exist
							if(filenumber<=file_counter-1)
							{
								//write the path tofilename
								sprintf(image_filename,"rotateme/%s",filelist[filenumber]->d_name);
								sprintf(only_filename,"%s",filelist[filenumber]->d_name);

								//close down file selection
								done =1;

								//returnera 1
								return 1;
							}
						}


					}

				}break;

			default:break;
			}

		}
		//lock screen surface
		Slock(screen);

            Clear_Surface(TrippleBuffer);

			//draw the topbar
			Draw_Image(TempImage,TrippleBuffer,0,0);

			//tell the user what to do
			Font_String(14,13,"Select which image you want to rotate.",TrippleBuffer,font_clean,cleanfont_space);

			//set text x & y position
			text_xpos=0; text_ypos=34;

				//loop through all filenames
				for(i = 2; i < file_counter; i++)
				{

					//write the filename
					sprintf(filename,"%s",filelist[i]->d_name);

						//display it on screen
						Font_String(text_xpos,text_ypos,filename,TrippleBuffer,font_clean,cleanfont_space);

						//move 10 pixels down to next row
						text_ypos+=10;

					//if we reached the end of the screen
					if(i == 45 || i == 89 || i == 133)
					{
						text_ypos=34;	//reset text y position
						text_xpos+=156;	//go to next column
					}
				}

		//convert the box x & y position the what filenumber we want to load

			//make sure the mouse is not on an illegal post
			if(Mousey>34 && Mousey<469 && Mousex<623)
			{
				//if its the first column
				if(selectbox_x==0){

					//convert y position to right filenummer
					filenumber = -1 + (selectbox_y-3)/10;
				}

                    //2nd column
					if(selectbox_x==156){

						//convert y position to right filenummer
						filenumber = 46 + (-3 + (selectbox_y-3)/10);
					}

					//3rd column
					if(selectbox_x==312){

						//convert y position to right filenummer
						filenumber = 90 + (-3 + (selectbox_y-3)/10);
					}

				//4th column
				if(selectbox_x==468){

					//convert y position to right filenummer
					filenumber = 134 + (-3 + (selectbox_y-3)/10);
				}
			}

				//if the mouse is below the top bar
				if(Mousey>34 && Mousey<469 && Mousex<623)
				{
					//draw the selection box
					Draw_Image(GFX_Select_Box,TrippleBuffer,selectbox_x,selectbox_y);
				}

            //copy the tripple buffer to screen
            Surface_Copy(TrippleBuffer,screen,0,0,640,480);

			//flip the screen
			SDL_Flip(screen);

		//unlock screen surface
		Sulock(screen);

	}

free(filelist);
return 0;
}

int main(int argc, char *argv[])
{
int done=0;
float angle=0;
Uint8 *keys;
int update_graphics=TRUE;
char msg[100];

int show_save_msg=FALSE;
int showcounter=0;

Init_SDL();


	//get the clean font
	Get_Anim("data/cleanfont.png",TempImage,font_clean,0,0,8,8,NUM_CHARACTERS,16,1);

    Get_Anim("data/selectbox.png",TempImage,&GFX_Select_Box,0,0,156,10,1,1,0);

    if(Select_Image_To_Load() == 0)
    {
        exit(1);
    }

    //load the image the user wants to rotate
    Image2Rotate = Load_And_Convert_Bitmap(image_filename);

    //set pixel format to the format of the screen
    PixelFormat = screen->format;

    //create the 2x scaled surface
    Rotated_2X = SDL_CreateRGBSurface(SDL_HWSURFACE,Image2Rotate->w*2,Image2Rotate->h*2,32,PixelFormat->Rmask,PixelFormat->Gmask,PixelFormat->Bmask,0);
    SDL_SetColorKey(Rotated_2X,SDL_SRCCOLORKEY|SDL_RLEACCEL,SDL_MapRGB(Rotated_2X->format,255,0,255));

    //create the 4x scaled surface
    Rotated_4X = SDL_CreateRGBSurface(SDL_HWSURFACE,Image2Rotate->w*4,Image2Rotate->h*4,32,PixelFormat->Rmask,PixelFormat->Gmask,PixelFormat->Bmask,0);
    SDL_SetColorKey(Rotated_4X,SDL_SRCCOLORKEY|SDL_RLEACCEL,SDL_MapRGB(Rotated_4X->format,255,0,255));

    //create the 8x scaled surface
    Rotated_8X = SDL_CreateRGBSurface(SDL_HWSURFACE,Image2Rotate->w*8,Image2Rotate->h*8,32,PixelFormat->Rmask,PixelFormat->Gmask,PixelFormat->Bmask,0);
    SDL_SetColorKey(Rotated_8X,SDL_SRCCOLORKEY|SDL_RLEACCEL,SDL_MapRGB(Rotated_8X->format,255,0,255));

    //create the scaled surfaces
    scale2x(Image2Rotate,Rotated_2X);
    scale2x(Rotated_2X,Rotated_4X);
    scale2x(Rotated_4X,Rotated_8X);

    SDL_Event event;

	while(!done)
	{
	    //get key states
        keys = SDL_GetKeyState(NULL);

		while ( SDL_PollEvent(&event) )
		{
			switch (event.type)
			{

			    case SDL_KEYUP:
				{
				    // user releases space key
                    if ( event.key.keysym.sym == SDLK_SPACE )
                    {
                        update_graphics = FALSE;
                        pressed = FALSE;
                    }

				    //if the user releases the left key
				    if ( event.key.keysym.sym == SDLK_LEFT)
				    {
				        //set update graphics to true
				        update_graphics = FALSE;
				    }
				    //if the user releases the right key
				    if ( event.key.keysym.sym == SDLK_RIGHT)
				    {
				        //set graphics update to true
				        update_graphics = FALSE;
				    }

				    if ( event.key.keysym.sym == SDLK_ESCAPE)
				    {
				        done=1;
				    }

				    if ( event.key.keysym.sym == SDLK_s)
				    {

                            //create the rotated surface from the 4x scale2x surface
                            RotateResult_4X = Rotate_Surface(Rotated_4X,(int)angle,0.25);

                            //create the rotated surface from the 8x scale2x surface
                            RotateResult_8X = Rotate_Surface(Rotated_8X,(int)angle,0.125);

                        //create the save surface
                        SaveSurface = SDL_CreateRGBSurface(SDL_HWSURFACE,RotateResult_2X->w/2,RotateResult_2X->h/2,32,PixelFormat->Rmask,PixelFormat->Gmask,PixelFormat->Bmask,0);
                        SDL_SetColorKey(SaveSurface,SDL_SRCCOLORKEY|SDL_RLEACCEL,SDL_MapRGB(SaveSurface->format,255,0,255));


                        //save the 2X image
				        sprintf(output_filename,"output/2x_angle%d_%s",(int)angle,only_filename);
				        Surface_Copy(RotateResult_2X,SaveSurface,0,0,RotateResult_2X->w/2,RotateResult_2X->h/2);
				        IMG_SavePNG(output_filename,SaveSurface,9);

                        //save the 4X image
				        sprintf(output_filename,"output/4x_angle%d_%s",(int)angle,only_filename);
				        Surface_Copy(RotateResult_4X,SaveSurface,0,0,RotateResult_4X->w/4,RotateResult_4X->h/4);
				        IMG_SavePNG(output_filename,SaveSurface,9);

				        //save the 8X image
				        sprintf(output_filename,"output/8x_angle%d_%s",(int)angle,only_filename);
				        Surface_Copy(RotateResult_8X,SaveSurface,0,0,RotateResult_8X->w/8,RotateResult_8X->h/8);
				        IMG_SavePNG(output_filename,SaveSurface,9);

				        show_save_msg = TRUE;
				        showcounter=1500;
				    }
				}break;

				case SDL_KEYDOWN:
				{
					if ( event.key.keysym.sym == SDLK_ESCAPE)
					{
						done = 1;
					}

				}break;
				//om användaren tryckte en musknapp
				case SDL_MOUSEBUTTONUP:
				{
					//om det var den vänstra musknappen
					if( event.button.button == SDL_BUTTON_LEFT )
					{
					    /*if(SDL_CollideBoundingBox(Rect_Mouse,Rect_Back))
					    {
					        done=1;
					    } */
					}
				}break;
			}

        }


                    if (keys[SDLK_SPACE])
                    {
                        if (!pressed)
                        {
                            angle = angles[++global_index];
                            pressed = TRUE;
                            if (global_index == 23)
                                global_index = -1;
                            update_graphics = TRUE;
                        }
                    }
 					if(keys[SDLK_LEFT])
					{
                        angle -= 0.1f;

                            if(angle<0)
                            {
                                angle = 360;
                            }
                        update_graphics = TRUE;
					}

					if(keys[SDLK_RIGHT])
					{
                        angle += 0.1f;

                            if(angle>360)
                            {
                                angle = 0;
                            }
                        update_graphics = TRUE;
					}

        Slock(screen);

        if(update_graphics == TRUE)
        {
            Clear_Surface(TrippleBuffer);

            //create the rotated surface from the 2x scale2x surface
            RotateResult_2X = Rotate_Surface(Rotated_2X,(int)angle,0.5);

            //draw the result on screen
            Draw_Image(RotateResult_2X,TrippleBuffer,320-RotateResult_2X->w/4,220-RotateResult_2X->h/4);
        }


            //copy the tripple buffer to screen
            Surface_Copy(TrippleBuffer,screen,0,0,640,480);

            sprintf(msg,"Left/Right = rotate image, S = save, ESC = quit");
            Font_String(0,0,msg,screen,font_clean,cleanfont_space);
            sprintf(msg,"angle:%d",(int)angle);
            Font_String(0,10,msg,screen,font_clean,cleanfont_space);

            if(show_save_msg==TRUE)
            {
                showcounter--;

                    if(showcounter<=0)
                    {
                        showcounter=0;
                        show_save_msg=FALSE;
                    }
                Font_String(0,20,"Rotated sprite saved",screen,font_clean,cleanfont_space);
            }

			//flip the screen
			SDL_Flip(screen);

		//unlock screen surface
		Sulock(screen);
	}

return 0;
}
