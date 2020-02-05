//
//  FigurasBasicasView.m
//  AppFigurasBasicasCocoa
//
//  Created by Fernando Alfonso Caldera Olivas on 17/03/19.
//  Copyright © 2019 Fernando Alfonso Caldera Olivas. All rights reserved.
//

#import "FigurasBasicasView.h"

@implementation FigurasBasicasView

@synthesize figura;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSRect rect = [self bounds];
    
    [[NSColor whiteColor] set];
    [NSBezierPath fillRect:rect];
    [path removeAllPoints];
    
    switch(figura){
        case TRIANGULO:{
            NSPoint p1, p2, p3;
            p1.x = rect.origin.x;
            p1.y = rect.origin.y;
            p2.x = rect.size.width / 2;
            p2.y = rect.size.height;
            p3.x = rect.size.width;
            p3.y = rect.origin.y;
            
            [graficos dibujarTrianguloEnCanvas:path conPuntoP1:p1 yPuntoP2:p2 yPuntoP3:p3 conColor:[NSColor redColor] yRelleno:YES];
            break;
        }
        case CUADRILATERO:{
            NSPoint p;
            p.x = rect.origin.x;
            p.y = rect.origin.y;
            [graficos dibujarCuadrilateroEnCanvas:path enPuntoEsquinaInferiorIzquierda:p conAncho:rect.size.width yAlto:rect.size.height conColor:[NSColor greenColor] yRelleno:YES];
            break;
        }
        case ELIPSE:{
            NSPoint pc;
            pc.x = rect.size.width / 2;
            pc.y = rect.size.height / 2;
            [graficos dibujarElipseEnCanvas:path enPuntoCentral:pc conAncho:rect.size.width yAlto:rect.size.height conColor:[NSColor blueColor] yRelleno:YES];
            break;
        }
        case ESTRELLA:{
            NSPoint p;
            p.x = rect.origin.x;
            p.y = rect.origin.y;
            
            [graficos dibujarEstrellaEnCanvas:path enPuntoEsquinaInferiorIzquierda:p conAncho:rect.size.width yAlto:rect.size.height conColor:[NSColor orangeColor] yRelleno:NO];
            break;
        }
        case ARBOL_FRACTAL:{
            NSPoint pich;
            pich.x = rect.size.width / 2;
            pich.y = rect.origin.y;
            
            [graficos dibujarArbolFractalEnCanvas:path enPuntoInferiorCentradoHorizontalmente:pich conAncho:rect.size.width yAlto:rect.size.height conIteraciones:16 delColor:[NSColor blueColor] alColor:[NSColor redColor] conAnchoDeLinea:15];
            break;
        }
        case TRIANGULO_SIERPINSKI:{
            NSPoint p;
            p.x = rect.origin.x;
            p.y = rect.origin.y;
            [graficos dibujarTrianguloDeSierpinskiEnCanvas:path enPuntoEsquinaInferiorIzquierda:p conAncho:rect.size.width yAlto:rect.size.height conIteraciones:12 delColor:[NSColor blueColor] alColor:[NSColor redColor] conAnchoDeLinea:15];
            break;
        }
        case SENOIDAL:{
            NSPoint p;
            p.x = rect.origin.x;
            p.y = rect.origin.y;
            [graficos dibujarSenoidalEnCanvas:path enPuntoEsquinaInferiorIzquierda:p conAncho:rect.size.width yAlto:rect.size.height delColor:[NSColor blueColor] alColor:[NSColor redColor]];
            break;
        }
    }
}

-(void) awakeFromNib{
    figura = NINGUNA;
    path = [NSBezierPath new];
    graficos = [Graficos new];
}

@end
