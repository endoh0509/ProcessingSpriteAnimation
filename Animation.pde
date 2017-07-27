class Animation {
  PImage[] imgs;
  int imageCount;
  int frame;

  Animation(String imagePrefix, int count) {
    imageCount = count;
    imgs = new PImage[imageCount];
    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 4) + ".png";
      imgs[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(imgs[frame], xpos, ypos);
  }
  
  void display(PGraphics pg, float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    pg.image(imgs[frame], xpos, ypos);
  }
  
  boolean isLast() {
    return imageCount - 1 == frame;
  }
  
  void setSize(int w, int h) {
    for(PImage img: imgs) {
      img.resize(w, h);
    }
  }
  
  int getWidth() {
    return imgs[0].width;
  }
  
  int getHeight() {
    return imgs[0].height;
  }
}