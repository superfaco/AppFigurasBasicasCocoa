//
//  FigurasBasicasController.m
//  AppFigurasBasicasCocoa
//
//  Created by Fernando Alfonso Caldera Olivas on 17/03/19.
//  Copyright © 2019 Fernando Alfonso Caldera Olivas. All rights reserved.
//

#import "FigurasBasicasController.h"

@implementation FigurasBasicasController

- (IBAction)btnDibujarClick:(id)sender {
    _btnDibujar.enabled = NO;
    _cvFigurasBasicasView.figura = _cbxFiguras.indexOfSelectedItem;
    [_cvFigurasBasicasView setNeedsDisplay:YES];
    _btnDibujar.enabled = YES;
}
@end
