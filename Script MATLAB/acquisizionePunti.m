    immagine=imread('teapot.png');
    imshow(immagine);
    [x,y]=getpts()
    save('x.txt','x','-ascii');
    save('y.txt','y','-ascii');
