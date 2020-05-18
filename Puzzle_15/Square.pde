public class Square {

    int x;
    int y;
    int w;
    int h;
    PImage img;

    public Square (PImage ref, int x, int y, int w, int h) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        
        img = createImage(w, h, RGB);
        // ref.loadPixels();
        // img.loadPixels();
        
        img = ref.get(x, y, w, h);
        // for (int j = y; j < y + h; j++) {
        //     for (int i = x; i < x + w; i++) {
        //         img.pixels[this.index(i - x, j - y, img)] = ref.pixels[this.index(i, j, ref)];
        //     }
        // }
        // img.updatePixels();
    }

    public void show() {
        image(img, x, y, w, h);
        stroke(0);
        strokeWeight(1);
        noFill();
        rect(x, y, w, h);
    }

    public void move(ArrayList<Square> puzzle) {
        int freeX = this.x;
        int freeY = this.y;
        for (int j = 0; j < puzzleSideSquare; j++) {
            for (int i = 0; i < puzzleSideSquare; i++) {
                boolean occupied = false;
                for (Square s : puzzle) {
                    if (s.contains((i * w) + w / 2, (j * h) + h / 2)) {
                        occupied = true;
                    }
                }
                if (!occupied) {
                    freeX = i * w;
                    freeY = j * h;
                }
            }
        }
        if (abs(x - freeX) == w && y == freeY) {
            moveTo(freeX, freeY);
        } else if (x == freeX && abs(y - freeY) == h) {
            moveTo(freeX, freeY);
        }   
    }

    public boolean canMove(ArrayList<Square> puzzle) {
        int freeX = this.x;
        int freeY = this.y;
        for (int j = 0; j < puzzleSideSquare; j++) {
            for (int i = 0; i < puzzleSideSquare; i++) {
                boolean occupied = false;
                for (Square s : puzzle) {
                    if (s.contains((i * w) + w / 2, (j * h) + h / 2)) {
                        occupied = true;
                    }
                }
                if (!occupied) {
                    freeX = i * w;
                    freeY = j * h;
                }
            }
        }
        if (abs(x - freeX) == w && y == freeY) {
            return true;
        } else if (x == freeX && abs(y - freeY) == h) {
            return true;
        }
        return false;
    }

    private int index(int x, int y, PImage ref) {
        return y * ref.width + x;
    }

    public void moveTo(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public boolean contains(float x, float y) {
        return (this.x <= x && x < this.x + this.w && this.y <= y && y < this.y + this.h); 
    }

    public void exchange(Square other) {
        int tmpX = this.x;
        this.x = other.x;
        other.x = tmpX;

        int tmpY = this.y;
        this.y = other.y;
        other.y = tmpY;
    }

}
