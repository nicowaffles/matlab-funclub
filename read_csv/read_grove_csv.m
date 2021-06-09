clear; clc;

user = getenv('username');

file_path = "";
file_name = "";

fullpath = file_path+file_name;       

messinterval = 1;                     

read_csv = readmatrix(fullpath);      

GM102B = read_csv(:, 1);              
GM302B = read_csv(:, 2);              
GM502B = read_csv(:, 3);              
GM702B = read_csv(:, 4);              

max_1 = length(GM102B);

n = linspace(1, max_1, max_1);       

sec_start = seconds(0);
sec_end = seconds(0) + messinterval*seconds(max_1);

sec_start.Format = 'hh:mm';
sec_end.Format = 'hh:mm';

ttime = linspace(sec_start, sec_end, max_1);

plot(ttime, GM102B, 'LineWidth', 1.5);    
hold on;
plot(ttime, GM302B, 'LineWidth', 1.5);    
hold on;
plot(ttime, GM502B, 'LineWidth', 1.5);    
hold on;
plot(ttime, GM702B, 'LineWidth', 1.5);    
hold off;

hAx = gca;
hAx.XTickLabel=hAx.XTickLabel;

ymin = -50;
ymax = 1050;

ylim([ymin ymax]);

grid on;

title("Verlauf der i.d. Luft befindlichen Gase");
ylabel("Konzentration / ppm");
xlabel("Zeit / hh:mm");
legend('GM102B (NO_2)', 'GM302B (C_2H_5OH)', 'GM502B (VOC)', 'GM702B (CO)');

graphname = strcat( erase(file_name ,".csv"), '_matlab');
%saveas(gcf, append(graphname,'.png'));
saveas(gcf, fullfile(file_path, graphname), 'png');
