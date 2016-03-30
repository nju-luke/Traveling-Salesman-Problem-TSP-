function Travel()    
    % ����������
    Location = randi(100,20,2); %������������
    X = Location(:,1);
    Y = Location(:,2);

    T = 1000;  %��ʼ���¶�
    dt = 1;
    num = 10;       %��ÿһ��T�·������ٴν�������
    Dis_1 = distance(X,Y);
    k = T/100;
    Dis_best = inf;

    while T > 0
        for j = 1:num
            
            X_ex = X;
            Y_ex = Y;
            
            ex_1 = randi(20);   %���ɽ�������
            ex_2 = randi(20);
            
            X_ex(ex_1) = X(ex_2);X_ex(ex_2) = X(ex_1);  %���ɽ����������
            Y_ex(ex_1) = Y(ex_2);Y_ex(ex_2) = Y(ex_1);
            
            Dis_ex = distance(X_ex,Y_ex);   %������ľ���
            P = exp((Dis_1-Dis_ex)/k/T);    %�������������ʱ�Ľ��ܸ���
            
            if Dis_ex < Dis_1               %�ȽϽ���ǰ���������Ƿ񽻻�
                X = X_ex;
                Y = Y_ex;
                Dis_1 = Dis_ex;
                if Dis_1 < Dis_best         %��������λ�ã����������������Ժ�ز�ȥ          
                    X_best = X_ex;
                    Y_best = Y_ex;
                    Dis_best = Dis_ex;
                end
            elseif rand > P
                X = X_ex;
                Y = Y_ex;
                Dis_1 = Dis_ex;
            end
        end
    T = T-dt;                           %����
    plot(X,Y)
    title(['distence=',num2str(Dis_1)])
    frame = getframe(gcf);
    end
    X_best = [0;X_best;0];
    Y_best = [0;Y_best;0];
    figure
    plot(X_best,Y_best)
    title(['distence=',num2str(Dis_best)])    
end

% function Dis = distance(X,Y)
%     length = size(X,1);
%     X1 = X(1:length-1);
%     Y1 = Y(1:length-1);
%     X2 = X(2:length);
%     Y2 = Y(2:length);
%     Dis = sqrt(sum((X1-X2).^2+(Y1-Y2).^2)); 
% end

function Dis = distance(X,Y)            %������ԭ�����
    length = size(X,1);
    X1 = [0;X(1:length-1)];
    Y1 = [0;Y(1:length-1)];   
    Dis = sqrt(sum((X1-X).^2+(Y1-Y).^2)+X(length)^2+Y(length)^2); 
end