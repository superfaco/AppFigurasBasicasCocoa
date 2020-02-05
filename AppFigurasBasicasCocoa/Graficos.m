//
//  Graficos.m
//  AppFigurasBasicasCocoa
//
//  Created by Fernando Alfonso Caldera Olivas on 17/03/19.
//  Copyright © 2019 Fernando Alfonso Caldera Olivas. All rights reserved.
//

#import "Graficos.h"

///Extensión de la clase Graficos
@interface Graficos()
///Declaración de métodos privados

///Convierte un color a su equivalente en entero en el sistema
///argb
-(NSInteger) convertirEnEnteroElColor:(NSColor*)color;
///Converte un entero en un color usando el formato argb
-(NSColor*) convertirEnColorElEntero:(NSInteger)entero;

///Este método es el método recursivo que se encarga de dibujar
///El arbol fractal
-(void) _dibujarArbolFractalEnCanvas:(NSBezierPath *)canvas enPuntoInferiorCentradoHorizontalmente:(NSPoint)pich conAncho:(NSInteger)ancho yAlto:(NSInteger)alto conAngulo:(CGFloat)angulo yLongitud:(NSInteger)longitud conIteraciones:(NSInteger)iteraciones eIteracionesMaximas:(NSInteger)iteracionesMaximas delColor:(NSColor *)colorInicial alColor:(NSColor *)colorFinal conAnchoDeLinea:(CGFloat)anchoDeLinea;

-(void) _dibujarTrianguloDeSierpinskiEnCanvas:(NSBezierPath *)canvas enPuntoSuperior: (NSPoint)puntoSuperior yPuntoInferiorIzquierdo:(NSPoint)puntoInferiorIzquierdo yPuntoInferiorDerecho:(NSPoint)puntoInferiorDerecho conIteraciones:(NSInteger)iteraciones eIteracionesMaximas:(NSInteger)iteracionesMaximas delColor:(NSColor *)colorInicial alColor:(NSColor *)colorFinal conAnchoDeLinea:(CGFloat)anchoDeLinea;
@end

@implementation Graficos
///Metodos públicos
-(void) dibujarTrianguloEnCanvas:(NSBezierPath *)canvas conPuntoP1:(NSPoint)p1 yPuntoP2:(NSPoint)p2 yPuntoP3:(NSPoint)p3 conColor:(NSColor *)color yRelleno:(BOOL)relleno{
    
    ///Establecemos color de relleno y trazado
    [color set];
    
    ///Trazamos el triangulo usando los puntos dados
    [canvas moveToPoint:p1];
    [canvas lineToPoint:p2];
    [canvas lineToPoint:p3];
    [canvas lineToPoint:p1];
    
    ///Rellenamos el triangulo según el parametro
    if(relleno){
        [canvas fill];
    }else{
        [canvas stroke];
    }
    
}

-(void) dibujarCuadrilateroEnCanvas:(NSBezierPath *)canvas enPuntoEsquinaInferiorIzquierda:(NSPoint)p conAncho:(NSInteger)ancho yAlto:(NSInteger)alto conColor:(NSColor *)color yRelleno:(BOOL)relleno{
    
    ///Establecemos color de relleno y trazado
    [color set];
    
    NSPoint aux;
    ///Trazamos el cuadrilatero usando los argumentos dados.
    [canvas moveToPoint:p];
    aux.x = p.x + ancho;
    aux.y = p.y;
    [canvas lineToPoint:aux];
    aux.y = p.y + alto;
    [canvas lineToPoint:aux];
    aux.x = p.x;
    [canvas lineToPoint:aux];
    [canvas lineToPoint:p];
    
    ///Rellenamos el cuadrilatero según el parametro
    if(relleno){
        [canvas fill];
    }else{
        [canvas stroke];
    }
    
}

-(void) dibujarElipseEnCanvas:(NSBezierPath *)canvas enPuntoCentral:(NSPoint)pc conAncho:(NSInteger)ancho yAlto:(NSInteger)alto conColor:(NSColor *)color yRelleno:(BOOL)relleno{
    
    ///Establecemos el color de relleno y trazado
    [color set];
    
    ///Calculamos donde va a estar el primer punto de la elipse
    /// (con angulo = 0)
    NSPoint aux;
    aux.x = pc.x + ancho / 2 * cos(0);
    aux.y = pc.y + alto / 2 * sin(0);
    
    ///Nos posicionamos en la primera posicion
    [canvas moveToPoint:aux];
    
    ///Iteramos 2 * PI * 100 - 1 veces para dibujar la elipse
    for(CGFloat i = 0; i < M_PI * 2; i+= 0.01){
        aux.x = pc.x + ancho / 2 * cos(i);
        aux.y = pc.y + alto / 2 * sin(i);
        [canvas lineToPoint:aux];
    }
    
    ///Unimos el ultimo y el primer punto.
    aux.x = pc.x + ancho / 2 * cos(0);
    aux.y = pc.y + alto / 2 * sin(0);
    [canvas lineToPoint:aux];
    
    ///Rellenamos la elipse segun el argumento
    if(relleno){
        [canvas fill];
    }else{
        [canvas stroke];
    }
    
}

-(void) dibujarEstrellaEnCanvas:(NSBezierPath *)canvas enPuntoEsquinaInferiorIzquierda:(NSPoint)p conAncho:(NSInteger)ancho yAlto:(NSInteger)alto conColor:(NSColor *)color yRelleno:(BOOL)relleno{
    
    ///Establecemos el color de relleno y trazado
    [color set];
    
    ///Calculamos el primer punto de la estrella
    /// (El punto del pico superior izquierdo
    NSPoint aux;
    aux.x = p.x;
    aux.y = p.y + alto / 3 * 2;
    
    ///Dibujamos la estrella
    [canvas moveToPoint:aux];
    aux.x = p.x + ancho;
    [canvas lineToPoint:aux];
    aux.x = p.x;
    aux.y = p.y;
    [canvas lineToPoint:aux];
    aux.x = p.x + ancho / 2;
    aux.y = p.y + alto;
    [canvas lineToPoint:aux];
    aux.x = p.x + ancho;
    aux.y = p.y;
    [canvas lineToPoint:aux];
    aux.x = p.x;
    aux.y = p.y + alto / 3 * 2;
    [canvas lineToPoint:aux];
    
    ///Rellenamos la estrella segun el argumento
    if(relleno){
        [canvas fill];
    }else{
        [canvas stroke];
    }
    
}

-(void) dibujarArbolFractalEnCanvas:(NSBezierPath *)canvas enPuntoInferiorCentradoHorizontalmente:(NSPoint)pich conAncho:(NSInteger)ancho yAlto:(NSInteger)alto conIteraciones:(NSInteger)iteraciones delColor:(NSColor *)colorInicial alColor:(NSColor *)colorFinal conAnchoDeLinea:(CGFloat)anchoDeLinea{
    
    ///Calculamos la longitud menor para hacer incrementos que se vuelvan
    ///infinitesimalmente pequeños (para que nunca se salga del puerto de visión).
    NSInteger longitud = ancho < alto? ancho : alto;
    longitud = longitud * 0.5;
    
    [self _dibujarArbolFractalEnCanvas:canvas enPuntoInferiorCentradoHorizontalmente:pich conAncho:ancho yAlto:alto conAngulo:M_PI_2 yLongitud: longitud  conIteraciones:iteraciones eIteracionesMaximas:iteraciones delColor:colorInicial alColor:colorFinal conAnchoDeLinea:anchoDeLinea];
}

-(void) dibujarTrianguloDeSierpinskiEnCanvas:(NSBezierPath *)canvas enPuntoEsquinaInferiorIzquierda:(NSPoint)p conAncho:(NSInteger)ancho yAlto:(NSInteger)alto conIteraciones:(NSInteger)iteraciones delColor:(NSColor *)colorInicial alColor:(NSColor *)colorFinal conAnchoDeLinea:(CGFloat)anchoDeLinea{
    ///Calculamos los 3 puntos del triángulo princiapl
    NSPoint puntoSuperior, puntoInferiorIzquierdo, puntoInferiorDerecho;
    puntoSuperior.x = p.x + ancho / 2;
    puntoSuperior.y = p.y + alto;
    puntoInferiorIzquierdo.x = p.x;
    puntoInferiorIzquierdo.y = p.y;
    puntoInferiorDerecho.x = p.x + ancho;
    puntoInferiorDerecho.y = p.y;
    
    ///Dibujamos el triángulo
    [self dibujarTrianguloEnCanvas:canvas conPuntoP1:puntoSuperior yPuntoP2:puntoInferiorIzquierdo yPuntoP3:puntoInferiorDerecho conColor:colorInicial yRelleno:NO];
    
    [self _dibujarTrianguloDeSierpinskiEnCanvas:canvas enPuntoSuperior:puntoSuperior yPuntoInferiorIzquierdo:puntoInferiorIzquierdo yPuntoInferiorDerecho:puntoInferiorDerecho conIteraciones:iteraciones eIteracionesMaximas:iteraciones delColor:colorInicial alColor:colorFinal conAnchoDeLinea:anchoDeLinea * 0.7];
}

-(void) dibujarSenoidalEnCanvas:(NSBezierPath *)canvas enPuntoEsquinaInferiorIzquierda:(NSPoint)p conAncho:(NSInteger)ancho yAlto:(NSInteger)alto delColor:(NSColor *)colorInicial alColor:(NSColor *)colorFinal{
    ///Establecemos el color inicial
    [colorInicial set];
    
    ///Calculamos el punto donde va a iniciar la senoidal.
    NSPoint aux;
    aux.x = p.x;
    aux.y = p.y + (alto - p.y) / 2;
    
    ///Calculamos los incrementos de color
    NSInteger colorIni = [self convertirEnEnteroElColor:colorInicial];
    NSInteger colorFin = [self convertirEnEnteroElColor:colorFinal];
    NSInteger dColor = (colorFin - colorIni) / (ancho - (p.x + 1));
    
    ///Nos movemos al primer punto.
    [canvas moveToPoint:aux];
    
    ///Iteramos mientras no se haya llegado al ancho deseado.
    CGFloat angulo = 0.01;
    for(aux.x++; aux.x <= ancho; aux.x++, angulo += 0.1){
        ///Calculamos donde va a estar el nuevo punto.
        aux.y = (p.y + (alto - p.y)/2) + alto / 2 * sin(angulo);
        colorIni += dColor;
        [[self convertirEnColorElEntero:colorIni] set];
        [canvas lineToPoint:aux];
        
        ///Dibujamos la linea
        [canvas stroke];
        
        ///Limpiamos el canvas
        [canvas removeAllPoints];
        
        ///Insertamos el punto actual
        [canvas moveToPoint:aux];
    }
    
}

///Metodos privados
-(NSColor*) convertirEnColorElEntero:(NSInteger)entero{
    ///Extraemos los componentes argb del entero y los normalizamos
    CGFloat a = (entero & (255u<<24u)) * 1.0 / (255u<<24u);
    CGFloat r = (entero & (255u<<16u)) * 1.0 / (255u<<16u);
    CGFloat g = (entero & (255u<<8u)) * 1.0 / (255u<<8u);
    CGFloat b = (entero & (255u)) * 1.0 / (255u);
    
    return [NSColor colorWithDeviceRed:r green:g blue:b alpha:a];
}

-(NSInteger) convertirEnEnteroElColor:(NSColor *)color{
    ///Extraemos los componentes argb del color y los re-escalamos para que ocupen sus respectivos rangos dentro del entero
    NSInteger a = [color alphaComponent] * (255u<<24u);
    NSInteger r = [color redComponent] * (255u<<16u);
    NSInteger g = [color greenComponent] * (255u<<8u);
    NSInteger b = [color blueComponent] * (255u);
    
    return a + r + g + b;
}

-(void) _dibujarArbolFractalEnCanvas:(NSBezierPath *)canvas enPuntoInferiorCentradoHorizontalmente:(NSPoint)pich conAncho:(NSInteger)ancho yAlto:(NSInteger)alto conAngulo:(CGFloat)angulo yLongitud:(NSInteger)longitud conIteraciones:(NSInteger)iteraciones eIteracionesMaximas:(NSInteger)iteracionesMaximas delColor:(NSColor *)colorInicial alColor:(NSColor *)colorFinal conAnchoDeLinea:(CGFloat)anchoDeLinea{
    
    if(iteraciones > 0){
        ///Establecemos el ancho de la linea
        [canvas setLineWidth:anchoDeLinea];
        
        ///Calculamos la variacion de los colores y al mismo tiempo,
        ///el incremento que debemos hacer al color inicial.
        NSInteger colorIni = [self convertirEnEnteroElColor:colorInicial];
        NSInteger colorFin = [self convertirEnEnteroElColor:colorFinal];
        NSInteger dColor = (colorFin - colorIni) / (iteracionesMaximas == 1? 1 : iteracionesMaximas - 1) * (iteracionesMaximas - iteraciones);
        
        ///Calculamos el color con la suma del color inicial mas el incremento.
        [[self convertirEnColorElEntero:colorIni + dColor] set];
        
        ///Nos movemos al punto inicial y trazamos una linea al punto final
        ///que calculamos con la longitud y el angulo (coords. polares).
        NSPoint aux;
        [canvas moveToPoint:pich];
        aux.x = pich.x + longitud * cos(angulo);
        aux.y = pich.y + longitud * sin(angulo);
        [canvas lineToPoint:aux];
        [canvas stroke];
        
        ///Limpiamos los puntos registrados del BezierPath
        [canvas removeAllPoints];
        
        ///Llamadas recursivas para las bifurcaciones del arbol
        [self _dibujarArbolFractalEnCanvas:canvas enPuntoInferiorCentradoHorizontalmente:aux conAncho:ancho yAlto:alto conAngulo:angulo + M_PI_4 yLongitud:longitud * 0.5 conIteraciones:iteraciones - 1 eIteracionesMaximas:iteracionesMaximas delColor:colorInicial alColor:colorFinal conAnchoDeLinea:anchoDeLinea * 0.5];
        
        [self _dibujarArbolFractalEnCanvas:canvas enPuntoInferiorCentradoHorizontalmente:aux conAncho:ancho yAlto:alto conAngulo:angulo - M_PI_4 yLongitud:longitud * 0.5 conIteraciones:iteraciones - 1 eIteracionesMaximas:iteracionesMaximas delColor:colorInicial alColor:colorFinal conAnchoDeLinea:anchoDeLinea * 0.5];
    }
    
}

-(void) _dibujarTrianguloDeSierpinskiEnCanvas:(NSBezierPath *)canvas enPuntoSuperior:(NSPoint)puntoSuperior yPuntoInferiorIzquierdo:(NSPoint)puntoInferiorIzquierdo yPuntoInferiorDerecho:(NSPoint)puntoInferiorDerecho conIteraciones:(NSInteger)iteraciones eIteracionesMaximas:(NSInteger)iteracionesMaximas delColor:(NSColor *)colorInicial alColor:(NSColor *)colorFinal conAnchoDeLinea:(CGFloat)anchoDeLinea{
    if(iteraciones > 0){
        ///Establecemos el ancho de la linea
        [canvas setLineWidth:anchoDeLinea];
        
        ///Calculamos la variacion de los colores y al mismo tiempo,
        ///el incremento que debemos hacer al color inicial.
        NSInteger colorIni = [self convertirEnEnteroElColor:colorInicial];
        NSInteger colorFin = [self convertirEnEnteroElColor:colorFinal];
        NSInteger dColor = (colorFin - colorIni) / (iteracionesMaximas) * (iteracionesMaximas - iteraciones + 1);
        
        ///Calculamos el color con la suma del color inicial mas el incremento.
        [[self convertirEnColorElEntero:colorIni + dColor] set];
        
        ///Calculamos los puntos del triangulo a dibujar.
        NSPoint puntoInferior, puntoSuperiorIzquierdo, puntoSuperiorDerecho;
        puntoInferior.x = puntoInferiorIzquierdo.x + (puntoInferiorDerecho.x - puntoInferiorIzquierdo.x) / 2;
        puntoInferior.y = puntoInferiorIzquierdo.y;
        puntoSuperiorIzquierdo.x = puntoInferiorIzquierdo.x + (puntoInferior.x - puntoInferiorIzquierdo.x) / 2;
        puntoSuperiorIzquierdo.y = puntoInferior.y + (puntoSuperior.y - puntoInferior.y) / 2;
        puntoSuperiorDerecho.x = puntoInferior.x + (puntoInferiorDerecho.x - puntoInferior.x) / 2;
        puntoSuperiorDerecho.y = puntoInferior.y + (puntoSuperior.y - puntoInferior.y) / 2;
        
        ///Dibujamos el triangulo
        [self dibujarTrianguloEnCanvas:canvas conPuntoP1:puntoInferior yPuntoP2:puntoSuperiorIzquierdo yPuntoP3:puntoSuperiorDerecho conColor:[self convertirEnColorElEntero:colorIni + dColor] yRelleno:NO];
        
        ///Limpiamos el Bezier path
        [canvas removeAllPoints];
        
        ///Hacemos las llamadas recursivas a los 3 triangulos resultantes.
        [self _dibujarTrianguloDeSierpinskiEnCanvas:canvas enPuntoSuperior:puntoSuperiorIzquierdo yPuntoInferiorIzquierdo:puntoInferiorIzquierdo yPuntoInferiorDerecho:puntoInferior conIteraciones:iteraciones - 1 eIteracionesMaximas:iteracionesMaximas delColor:colorInicial alColor:colorFinal conAnchoDeLinea:anchoDeLinea * 0.7];
        
        [self _dibujarTrianguloDeSierpinskiEnCanvas:canvas enPuntoSuperior:puntoSuperiorDerecho yPuntoInferiorIzquierdo:puntoInferior yPuntoInferiorDerecho:puntoInferiorDerecho conIteraciones:iteraciones - 1 eIteracionesMaximas:iteracionesMaximas delColor:colorInicial alColor:colorFinal conAnchoDeLinea:anchoDeLinea * 0.7];
        
        [self _dibujarTrianguloDeSierpinskiEnCanvas:canvas enPuntoSuperior:puntoSuperior yPuntoInferiorIzquierdo:puntoSuperiorIzquierdo yPuntoInferiorDerecho:puntoSuperiorDerecho conIteraciones:iteraciones - 1 eIteracionesMaximas:iteracionesMaximas delColor:colorInicial alColor:colorFinal conAnchoDeLinea:anchoDeLinea * 0.7];
    }
    
}

@end
