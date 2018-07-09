
N = 1000;

for i = 1:20000
    figure(1);
    
    set (gcf,'Position',[0,0,320,320], 'color','black')

    x_1 = randi(500);
    y_1 = randi(500);
    x_2 = randi([100, 200]);
    y_2 = randi([100, 200]);
    x_3 = randi([200, 300]);
    y_3 = randi([200, 300]);
    x_4 = randi(500);
    y_4 = randi(500);
    
    P = [x_1 y_1; x_2 y_2; x_4 y_4];
    [x, y] = BezierCurve(N, P);
    plot(x, y, 'w-', 'LineWidth', 2)
    axis([0 500 0 500])
    set(gca,'position',[0,0,1,1])
    set(gca,'ytick',[]);
    set(gca,'xtick',[]);
    box off
    axis off
    filename = [['C:\Users\jacky\Desktop\TestData\imgs\', num2str(i, '%05d')],'.png'];
    saveas(1, filename);
    
    step = 20;
    x_ = x(1:step:1000, :);
    y_ = 500 - y(1:step:1000, :);
    vessel = int32([x_ y_]);
    vessel = vessel - 1; % for python index
    vesselname = [['C:\Users\jacky\Desktop\TestData\vessels\', num2str(i, '%05d')],'.mat'];
    save(vesselname, 'vessel');
    
end



function [x y] = BezierCurve(N, P)
% This function constructs a Bezier curve from given control points. P is a 
% vector of control points. N is the number of points to calculate. 
% 
% Example: 
% 
% P = [0 0; 1 1; 2 5; 5 -1]; 
% y = BezierCurve(1000, P); 
% plot(x, y, P(:, 1), P(:, 2), 'x-', 'LineWidth', 2); set(gca, 'FontSize', 16) 
% 
% Prakash Manandhar, pmanandhar@umassd.edu

Np = size(P, 1); 
u = linspace(0, 1, N); 
B = zeros(N, Np); 
for i = 1:Np 
B(:,i) = nchoosek(Np-1,i-1).*u.^(i-1).*(1-u).^(Np-i); %B is the Bernstein polynomial value 
end 
S = B*P; 
x = S(:, 1);
y = S(:, 2);
end


