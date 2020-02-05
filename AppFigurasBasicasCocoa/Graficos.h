//
//  Graficos.h
//  AppFigurasBasicasCocoa
//
//  Created by Fernando Alfonso Caldera Olivas on 17/03/19.
//  Copyright © 2019 Fernando Alfonso Caldera Olivas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface Graficos : NSObject
-(void) dibujarTrianguloEnCanvas:(NSBezierPath*)canvas conPuntoP1:(NSPoint)p1 yPuntoP2:(NSPoint)p2 yPuntoP3:(NSPoint)p3 conColor:(NSColor*)color yRelleno:(BOOL)relleno;
-(void) dibujarCuadrilateroEnCanvas:(NSBezierPath*)canvas enPuntoEsquinaInferiorIzquierda:(NSPoint)p conAncho:(NSInteger)ancho yAlto:(NSInteger)alto conColor:(NSColor*)color yRelleno:(BOOL)relleno;
-(void) dibujarElipseEnCanvas:(NSBezierPath*)canvas enPuntoCentral:(NSPoint)pc conAncho:(NSInteger)ancho yAlto:(NSInteger)alto conColor:(NSColor*)color yRelleno:(BOOL)relleno;
-(void) dibujarEstrellaEnCanvas:(NSBezierPath*)canvas enPuntoEsquinaInferiorIzquierda:(NSPoint)p conAncho:(NSInteger)ancho yAlto:(NSInteger)alto conColor:(NSColor*)color yRelleno:(BOOL)relleno;
-(void) dibujarArbolFractalEnCanvas:(NSBezierPath*)canvas enPuntoInferiorCentradoHorizontalmente:(NSPoint)pich conAncho:(NSInteger)ancho yAlto:(NSInteger)alto conIteraciones:(NSInteger)iteraciones delColor:(NSColor*)colorInicial alColor:(NSColor*)colorFinal conAnchoDeLinea:(CGFloat)anchoDeLinea;
-(void) dibujarTrianguloDeSierpinskiEnCanvas:(NSBezierPath*)canvas enPuntoEsquinaInferiorIzquierda:(NSPoint)p conAncho:(NSInteger)ancho yAlto:(NSInteger)alto conIteraciones:(NSInteger)iteraciones delColor:(NSColor*)colorInicial alColor:(NSColor*)colorFinal conAnchoDeLinea:(CGFloat)anchoDeLinea;
-(void) dibujarSenoidalEnCanvas:(NSBezierPath*)canvas enPuntoEsquinaInferiorIzquierda:(NSPoint)p conAncho:(NSInteger)ancho yAlto:(NSInteger)alto delColor:(NSColor*)colorInicial alColor:(NSColor*)colorFinal;
@end
