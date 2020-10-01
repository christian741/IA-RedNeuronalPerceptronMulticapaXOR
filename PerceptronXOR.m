%------------------------------
%    Perceptron XOR MultiCapa
%------------------------------
%Entradas
x1 = [0,1,0,1];
x2 = [0,0,1,1];
%umbral
theta= -1;
theta1= -1;
theta2= -1;
theta3= -1;

%Coeficiente de aprendizaje
alpha = 0.02;

%salida deseada
ySalida = [0,1,1,0];

%Validacion
validador = false;

%PESO CAPA DE ENTRADA
% W= Peso #= Capa   #=X o entrada
w1X1= randi([1 100],1,1)/100;%X1 a Capa Oculta 1 == Y1
w1X2= randi([1 100],1,1)/100;%X2 a Capa Oculta 1 == Y1

w2X1= randi([1 100],1,1)/100;%X1 a Capa Oculta 2 == Y2
w2X1= randi([1 100],1,1)/100;%X2 a Capa Oculta 2 == Y2

%PESO DE SALIDA
w3Y1= randi([1 100],1,1)/100;
w3Y2= randi([1 100],1,1)/100;


w1X1 =1;
w1X2 =1;

% w2X1=1;
% w2X1=1;
% 
% w3Y1 =1;
% w3Y2 =-1.5;
%Error de deltas

errorDeltaOculta1 =0 ;
errorDeltaOculta2 =0 ;
errorDeltaSalida =0 ;

%Valores de Salida

y1= 0;
y2= 0;
yXOR = 0;

%NET Por CAPAS
NET01 =0;%capa oculta 1
NET02 =0;%capa oculta 2
disp("________________________________Empieza entrenamiento___________________________________");

%%Array de entrenamiento
arrayEntrenamiento =[];
iteraciones =0;
i=1;
error = 0;
%Error de la Capa Salida
errorReal =0;
%Error de la Capa ocultas
errorEstimadoOculta1 =0;
errorEstimadoOculta2 =0;
%FUNCION SIGMOIDE
%           1
% f(y)= __________
%        1+(e^(-y))
%e = 2,71828;
%DERIVADA DE SIGMOIDE
%
% f'(y)=  y(1-y))
%
%
e=2.71828;

arraySalida = [];
%while validador == false
    
    while i<=4
        
        %-------------Propagacion hacia Adelante------------
        %Neurona oculta 1
        %NET01= (theta*wU1)+(x1(i)*w1X1)+(x2(i)*w1X2);
        NET01= (x1(i)*w1X1)+(x2(i)*w1X2);
        y1=1/(1+(e^(-1*NET01)));%Aplico la funcion sigmoide
        
        %Neurona oculta 2
        %NET02= (theta*wU2)+(x1(i)*w2X1)+(x2(i)*w2X2);
        NET02= (x1(i)*w2X1)+(x2(i)*w2X2);
        y2=1/(1+(e^(-1*NET02)));%Aplico la funcion sigmoide
        
        %Neurona de Salida
        %NETSalida= (theta*wUSalida)+(y1*w3Y1)+(y2*w3Y2);
        NETSalida= (y1*w3Y1)+(y2*w3Y2);
        yXOR=1/(1+(e^(-1*NETSalida)));%Aplico la funcion sigmoide
                
        %-------------Propagacion hacia Atras------------
        %Determinar los nuevos pesos
       
        
        %Capa de Salida
        errorReal =ySalida(i)-yXOR;
        
        errorDeltaSalida = yXOR*(ySalida(i)-yXOR)*(errorReal);
        %Nuevo peso = Peso anterio * Coefiente de aprendizaje* señal de entrada * errorDeltaSalida
        w3Y1= w3Y1*alpha*y1*errorDeltaSalida;
        w3Y2= w3Y2*alpha*y2*errorDeltaSalida;
        
        %Capa de Ocultas
        %------------------
        %Capa 1
        errorEstimadoOculta1 = y1*(ySalida(i)-y1)*w3Y1*errorDeltaSalida;
        %Nuevo peso 
        w1X1 = w1X1+alpha*x1(i)*errorEstimadoOculta1;
        w1X2 = w1X2+alpha*x2(i)*errorEstimadoOculta1;
        
         %------------------
        %Capa 2
        errorEstimadoOculta2 = y2*(ySalida(i)-y2)*w3Y2*errorDeltaSalida;
        %Nuevo peso 
        w2X1 = w2X1+alpha*x1(i)*errorEstimadoOculta2;
        w2X2 = w2X2+alpha*x2(i)*errorEstimadoOculta2;
        
        disp("Error Real" + errorReal);
        iteraciones = iteraciones +1;
        disp("")
        
        i=i+1;
        
        
    end
    
    
%end

disp("----------------fin de entrenamiento-----------------------------");
disp("Numero de iteraciones "+ iteraciones);
disp("----------------XOR-----------------------------");
for i=1:1:4
   disp("array entreamiento con entradas  x1 = ("+x1(i)+") x2= ("+x2(i)+") es igual a =  ");
   disp("salida deseada "+ySalida(i));
end
%%Diagramas 
disp(" Pesos Finales");
%Capa Salida
disp(" Pesos Finales Capa Salida");
disp("w3Y1 = "+ w3Y1);
disp("w3Y2 = "+ w3Y1);
disp(" Pesos Finales Capa Oculta 1");
disp("w1X1 = "+ w1X1);
disp("w1X2 = "+ w1X2);
disp(" Pesos Finales Capa Oculta 2");
disp("w2X1 = "+ w2X1);
disp("w2Y2 = "+ w2X2);

