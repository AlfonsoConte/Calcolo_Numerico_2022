function [curva] = Funzione_Nurbs(punti, ordine, vettoreNodi, weights)

    P = punti; %Punti di controllo in input
    n = size(P,2) - 1; %Numero di punti di controllo
    k = ordine; %Ordine della curva in input
    breakPoints = vettoreNodi; 
    w = weights; %Vettore dei pesi in input
    t=linspace(min(breakPoints),max(breakPoints),500); %range del parametro t
    B = cell(n + k,k);  %Vettore funzioni di base (B-spline)

    %CALCOLO B-SPLINE DI BASE
    for i=1:k 
        if i==1 %Caso base (è una versione iterativa, dal basso all'alto e non ricorsiva)
            for j=1:n+k 
                for l=1:length(t)
                    if t(l)>breakPoints(j) && t(l)<breakPoints(j+1) 
                        B{j,i}(l)=1; %Se compreso tra tj e tj+1 vale 1    
                    else
                        B{j,i}(l)=0; %Dichiariamo un vettore per le funzioni di base (b-spline)
                end
            end
        end

        else %Non è il caso base                   
            for j=1:(length(B(:,i-1))-(i-1))         
                for l=1:length(t)
                    if (breakPoints(j+i-1)-breakPoints(j))==0
                        temp1=0; 
                    else 
                        %costruiamo la bspline
                        temp1=((t(l)-breakPoints(j))*B{j,i-1}(l))/(breakPoints(j+i-1)-breakPoints(j)); 
                    end
                    if (breakPoints(j+i)-breakPoints(j+1))==0
                        temp2=0; 
                    else
                        temp2=((breakPoints(j+i)-t(l))*B{j+1,i-1}(l))/(breakPoints(j+i)-breakPoints(j+1));
                    end
                    B{j,i}(l)=temp1+temp2;
                end
            end
        end
    end

    %CALCOLO DELLE R_{i,h} 
    R = cell(n + 1,1); %Array per funzioni B_spline razionali:
    denom = zeros(1,length(t)); %DENOMINATORI funzioni R_{i,h}
    for i = 1:n+1
        denom = w(i) * B{i,k} + denom;
    end
    for i = 1:n+1 %calcolo dei NUMERATORI e R_{i,h}
        num = w(i) * B{i,k};
        R{i,1} = num./denom;
    end

    %CALCOLO CURVA NURBS
    curva = zeros(2,length(t)); %matrice per i punti della curva
    for i = 1:n+1
        curva(1,:) = P(1,i) * R{i,1} + curva(1,:);
    end
    for j = 1:n+1
        curva(2,:) = P(2,j) * R{j,1} + curva(2,:);
    end
    curva(:,1) = P(:,1);
    curva(:,end) = P(:,end);
    
end