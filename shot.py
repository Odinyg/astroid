import pygame
from circleshape import CircleShape
from constants import *
 
class Shot(CircleShape):
    def __init__(self, x, y,):
        super().__init__(x,y)

    def draw(self, screen):
        pygame.draw.circle(screen, "whith", self.position, SHOOT_RADIUS, 2)

    def update(self, dt):
        self.position += self.velocity * dt



