class Cactus extends Obstacle {
    boolean isActive;
    
    public Cactus() {
        super();
        this.isActive = true;
    }

    @Override
    public void moveObstacle(int speed) {
        if (this.isActive) {
            super.xPos = super.xPos - 10 - speed;
            if(super.xPos < -50) {
                super.xPos = width;
                this.isActive = false;
                rock.activate();
            }
            stroke(#237543);
            strokeWeight(20);
            line(super.xPos, super.yPos, super.xPos, super.yPos - 85);
            line(super.xPos, super.yPos - 40, super.xPos - 25, super.yPos - 40);
            line(super.xPos - 25, super.yPos - 40, super.xPos-25, super.yPos - 60);
            line(super.xPos, super.yPos - 20, xPos + 25, yPos - 20);
            line(super.xPos + 25, super.yPos - 20, super.xPos + 25, super.yPos - 50);
            strokeWeight(1);
            stroke(255);
            if (this.collisionDetected()) {
                super.xPos = width;
                this.isActive = false;
                rock.activate();
                super.fails += 1;
                delay(1000);
            }
        }
    }

    @Override
    public void activate() {
        this.isActive = true;
    }

    @Override
    public boolean collisionDetected() {
        boolean debugMode = true;
        float characterPos = amogus.getXpos();
        if (debugMode == true) {
            stroke(#FF0000);
            line(super.xPos-20, super.yPos - 25, 100, 400 - characterPos);
            line(super.xPos-20, super.yPos - 60, 100, 400 - characterPos);
            line(super.xPos, super.yPos - 80, 100, 400 - characterPos);
            line(super.xPos + 25, super.yPos - 45, 100, 400 - characterPos);
            stroke(255);
        }
      
        if (dist(xPos - 20, yPos - 25, 100, 400 - characterPos) <= 30) {
            return true;
        }
        if (dist(xPos - 20, yPos - 60, 100, 400 - characterPos) <= 30) {
            return true;
        }
        if (dist(xPos, yPos - 80, 100, 400 - characterPos) <= 20) {
            return true;
        }
        if (dist(xPos + 25, yPos - 45, 100, 400 - characterPos) <= 20) { 
            return true;
        }
        return false;
    }
}