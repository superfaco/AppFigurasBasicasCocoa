//
//  FigurasBasicasController.h
//  AppFigurasBasicasCocoa
//
//  Created by Fernando Alfonso Caldera Olivas on 17/03/19.
//  Copyright © 2019 Fernando Alfonso Caldera Olivas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FigurasBasicasView.h"
#import <Cocoa/Cocoa.h>

@interface FigurasBasicasController : NSObject
@property (weak) IBOutlet NSComboBox *cbxFiguras;
@property (weak) IBOutlet NSButton *btnDibujar;
@property (weak) IBOutlet FigurasBasicasView *cvFigurasBasicasView;
- (IBAction)btnDibujarClick:(id)sender;
@end
