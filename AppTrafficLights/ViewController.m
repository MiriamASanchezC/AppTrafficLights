//
//  ViewController.m
//  AppTrafficLights
//
//  Created by Miriam Sanchez on 04/03/25.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    scoreInt = 0;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i",scoreInt];
}
-(void)startTimer{
    timerInt -=1;
    if (timerInt == 2) {
        self.trafficLight.image = [UIImage imageNamed:@"trafficLight3"];
    }else  if (timerInt == 1) {
        self.trafficLight.image = [UIImage imageNamed:@"trafficLight2"];
    }else  if (timerInt == 0) {
        self.trafficLight.image = [UIImage imageNamed:@"trafficLight1"];
        [timer invalidate];
        //iniciar el timer del contador
        scoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(scoreCounter) userInfo:nil repeats:YES];
        UIFont *futuraBoldFont = [UIFont fontWithName:@"Futura Bold" size:40.0];
        NSDictionary *attibutes = @{NSFontAttributeName:futuraBoldFont};
        NSAttributedString *attributedTitle = [[NSAttributedString alloc]initWithString:@"Stop" attributes:attibutes];
        [self.startButton setAttributedTitle:attributedTitle forState:UIControlStateNormal];
    }
    //self.startButton.titleLabel.font = [UIFont fontWithName:@"Farah Regular" size:40.0];
      //  [self.startButton setTitle:@"Stop" forState:UIControlStateNormal];
     //   [self.startButton setFont:[UIFont systemFontOfSize:40]];
    }
   
    
    
    

-(void)scoreCounter{
    scoreInt ++;
    self.scoreLabel.text = [NSString stringWithFormat:@"%i",scoreInt];
    
}

- (IBAction)startGame:(id)sender {
    if (scoreInt == 0) {
        timerInt = 3;
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startTimer) userInfo:nil repeats:YES];
    }else{
        [scoreTimer invalidate];
    }
}
@end
