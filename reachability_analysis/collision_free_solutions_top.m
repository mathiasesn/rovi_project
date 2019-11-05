%% Grasp the cylinder from the top
% Cylinder at left top corner
clc; clear;

data = load("data_cylinder_top/data_cylinder_-0.36_0.56_top.txt");
X = data(:, 1);
Y = data(:, 2);
Z = data(:, 3) + 1;

max_value = max(Z);
cmap = colormap(parula(max_value));
c = cmap(Z);

figure('Name', 'Scatter3: Cylinder side')
scatter3(X, Y, Z, 100, c, 'filled')
grid on

figure('Name', 'Scatter: Cylinder side')
scatter(X, Y, 100, c, 'filled')

% Table
pos = [-0.4 -0.6 0.8 1.2];
rectangle('Position', pos);

% Pick area
pos = [-0.4 0.3 0.8 0.3];
pick = rectangle('Position', pos);
pick.LineWidth = 1.5;
pick.LineStyle = '--';
text(0, 0.55,'Pick area','HorizontalAlignment','center')

% Place area
pos = [0.2 -0.6 0.2 0.2];
place = rectangle('Position', pos);
place.LineWidth = 1.5;
place.LineStyle = '--';
text(0.3, -0.45, 'Place area','HorizontalAlignment','center')

% Cylinders
pos = [-0.39 0.54 0.05 0.05];
c1 = rectangle('Position', pos, 'Curvature', [1 1]);
c1.FaceColor = 'k';

% pos = [-0.05 0.424 0.05 0.05];
% c2 = rectangle('Position', pos, 'Curvature', [1 1]);
% c2.FaceColor = 'k';

% pos = [0.34 0.54 0.05 0.05];
% c3 = rectangle('Position', pos, 'Curvature', [1 1]);
% c3.FaceColor = 'k';

% pos = [0.275 -0.55 0.05 0.05];
% c4 = rectangle('Position', pos, 'Curvature', [1 1]);
% c4.FaceColor = 'k';

axis equal

% axis names
xlabel('x position of the robot base.')
ylabel('y position of the robot base.')

%% Grasp the cylinder from the top
% Cylinder at right top corner
clc; clear;

data = load("data_cylinder_top/data_cylinder_0.36_0.56_top.txt");
X = data(:, 1);
Y = data(:, 2);
Z = data(:, 3) + 1;

max_value = max(Z);
cmap = colormap(parula(max_value));
c = cmap(Z);

figure('Name', 'Scatter3: Cylinder side')
scatter3(X, Y, Z, 100, c, 'filled')
grid on

figure('Name', 'Scatter: Cylinder side')
scatter(X, Y, 100, c, 'filled')

% Table
pos = [-0.4 -0.6 0.8 1.2];
rectangle('Position', pos);

% Pick area
pos = [-0.4 0.3 0.8 0.3];
pick = rectangle('Position', pos);
pick.LineWidth = 1.5;
pick.LineStyle = '--';
text(0, 0.55,'Pick area','HorizontalAlignment','center')

% Place area
pos = [0.2 -0.6 0.2 0.2];
place = rectangle('Position', pos);
place.LineWidth = 1.5;
place.LineStyle = '--';
text(0.3, -0.45, 'Place area','HorizontalAlignment','center')

% Cylinders
% pos = [-0.39 0.54 0.05 0.05];
% c1 = rectangle('Position', pos, 'Curvature', [1 1]);
% c1.FaceColor = 'k';

% pos = [-0.05 0.424 0.05 0.05];
% c2 = rectangle('Position', pos, 'Curvature', [1 1]);
% c2.FaceColor = 'k';

pos = [0.34 0.54 0.05 0.05];
c3 = rectangle('Position', pos, 'Curvature', [1 1]);
c3.FaceColor = 'k';

% pos = [0.275 -0.55 0.05 0.05];
% c4 = rectangle('Position', pos, 'Curvature', [1 1]);
% c4.FaceColor = 'k';

axis equal

% axis names
xlabel('x position of the robot base.')
ylabel('y position of the robot base.')

%% Grasp the cylinder from the top
% Cylinder at center of pick area
clc; clear;

data = load("data_cylinder_top/data_cylinder_0.3_-0.5_top.txt");
X = data(:, 1);
Y = data(:, 2);
Z = data(:, 3) + 1;

max_value = max(Z);
cmap = colormap(parula(max_value));
c = cmap(Z);

figure('Name', 'Scatter3: Cylinder side')
scatter3(X, Y, Z, 100, c, 'filled')
grid on

figure('Name', 'Scatter: Cylinder side')
scatter(X, Y, 100, c, 'filled')

% Table
pos = [-0.4 -0.6 0.8 1.2];
rectangle('Position', pos);

% Pick area
pos = [-0.4 0.3 0.8 0.3];
pick = rectangle('Position', pos);
pick.LineWidth = 1.5;
pick.LineStyle = '--';
text(0, 0.55,'Pick area','HorizontalAlignment','center')

% Place area
pos = [0.2 -0.6 0.2 0.2];
place = rectangle('Position', pos);
place.LineWidth = 1.5;
place.LineStyle = '--';
text(0.3, -0.45, 'Place area','HorizontalAlignment','center')

% Cylinders
% pos = [-0.39 0.54 0.05 0.05];
% c1 = rectangle('Position', pos, 'Curvature', [1 1]);
% c1.FaceColor = 'k';

% pos = [-0.05 0.424 0.05 0.05];
% c2 = rectangle('Position', pos, 'Curvature', [1 1]);
% c2.FaceColor = 'k';

% pos = [0.34 0.54 0.05 0.05];
% c3 = rectangle('Position', pos, 'Curvature', [1 1]);
% c3.FaceColor = 'k';

pos = [0.275 -0.55 0.05 0.05];
c4 = rectangle('Position', pos, 'Curvature', [1 1]);
c4.FaceColor = 'k';

axis equal

% axis names
xlabel('x position of the robot base.')
ylabel('y position of the robot base.')

%% All cylinders
clc; clear;

data1 = load("data_cylinder_top/data_cylinder_-0.36_0.56_side.txt");
data2 = load("data_cylinder_top/data_cylinder_0.36_0.56_side.txt");
data3 = load("data_cylinder_top/data_cylinder_0.3_-0.5_side.txt");
X = [data1(:, 1); data2(:, 1); data3(:, 1)];
Y = [data1(:, 2); data2(:, 2); data3(:, 2)];
Z = [data1(:, 3); data2(:, 3); data3(:, 3)] + 1;

max_value = max(Z);
cmap = colormap(parula(max_value));
c = cmap(Z);

figure('Name', 'Scatter3: Cylinder side')
scatter3(X, Y, Z, 100, c, 'filled')
grid on

figure('Name', 'Scatter: Cylinder side')
scatter(X, Y, 100, c, 'filled')

% Table
pos = [-0.4 -0.6 0.8 1.2];
rectangle('Position', pos);

% Pick area
pos = [-0.4 0.3 0.8 0.3];
pick = rectangle('Position', pos);
pick.LineWidth = 1.5;
pick.LineStyle = '--';
text(0, 0.55,'Pick area','HorizontalAlignment','center')

% Place area
pos = [0.2 -0.6 0.2 0.2];
place = rectangle('Position', pos);
place.LineWidth = 1.5;
place.LineStyle = '--';
text(0.3, -0.45, 'Place area','HorizontalAlignment','center')

% Cylinders
pos = [-0.39 0.54 0.05 0.05];
c1 = rectangle('Position', pos, 'Curvature', [1 1]);
c1.FaceColor = 'k';

pos = [0.34 0.54 0.05 0.05];
c3 = rectangle('Position', pos, 'Curvature', [1 1]);
c3.FaceColor = 'k';

pos = [0.275 -0.55 0.05 0.05];
c4 = rectangle('Position', pos, 'Curvature', [1 1]);
c4.FaceColor = 'k';

axis equal

% axis names
xlabel('x position of the robot base.')
ylabel('y position of the robot base.')