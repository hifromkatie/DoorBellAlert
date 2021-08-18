import paho.mqtt.client as mqtt
import pygame
import pygame.freetype

def on_message(client, userdata, msg):
    print(msg.payload)
    if (str(msg.payload) == "b'0'"):
        print("Please ring door bell ----->")
        screen.fill((0,0,0))
        screen.blit(message0, (400 - message0.get_width() // 2, 240 - message0.get_height() // 2))
        pygame.display.flip()
    if (str(msg.payload) == "b'1'"):
        print("Just Comming, please wait")
        screen.fill((255,255,255))
        screen.blit(message1, (400 - message0.get_width() // 2, 240 - message0.get_height() // 2))        
        pygame.display.flip()
    if (str(msg.payload) == "b'2'"):
        print("We're out, please leave parcels in the shed")
        screen.fill((255,255,255))
        screen.blit(message2, (400 - message0.get_width() // 2, 240 - message0.get_height() // 2))        
        pygame.display.flip()
    if (str(msg.payload) == "b'3'"):
        print("We're in the garden, please come around to the back gate")
        screen.fill((255,255,255))
        screen.blit(message3, (400 - message0.get_width() // 2, 240 - message0.get_height() // 2))        
        pygame.display.flip()        

pygame.init()
screen = pygame.display.set_mode((0,0), pygame.FULLSCREEN)
#screen = pygame.display.set_mode((0,0))
pygame.mouse.set_visible(0)
font = pygame.font.SysFont("comicsansms", 72)

message0 = font.render("Please ring door bell ----->", True, (255,255, 255))
message1 = font.render("Just comming, please wait", True, (0,0, 0))
message2 = font.render("We're out, please leave parcels in the shed", True, (0,0, 0))
message3 = font.render("We're in the garden, please come around to the back garden", True, (0,0, 0))

screen.fill((0,0,0))
screen.blit(message0, (400 - message0.get_width() // 2, 240 - message0.get_height() // 2))
pygame.display.flip()


client = mqtt.Client()
client.on_message = on_message

client.connect("192.168.0.166", 1883, 60)
client.subscribe("doorMessage",0)

running = True
while running:    
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running= False
        elif event.type == pygame.KEYDOWN:
            if event.key == pygame.K_ESCAPE:
                running = False
    client.loop()

pygame.quit()
