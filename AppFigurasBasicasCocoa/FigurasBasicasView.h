//
//  FigurasBasicasView.h
//  AppFigurasBasicasCocoa
//
//  Created by Fernando Alfonso Caldera Olivas on 17/03/19.
//  Copyright © 2019 Fernando Alfonso Caldera Olivas. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Graficos.h"

enum Figuras{
    TRIANGULO = 0,
    CUADRILATERO,
    ELIPSE,
    ESTRELLA,
    ARBOL_FRACTAL,
    TRIANGULO_SIERPINSKI,
    SENOIDAL,
    NINGUNA
};
@interface FigurasBasicasView : NSView
{
    NSBezierPath* path;
    NSInteger figura;
    Graficos* graficos;
}
@property(nonatomic, readwrite) NSInteger figura;
@end
