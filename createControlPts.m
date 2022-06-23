function [Cref, Xref, Yref, Aref] = createControlPts(idxC, idxX, idxY, width, height, markers)

% Calculate the reference point paired with the position of the finder.
ost = 7; %Margin (number of cells) from the upper left reference point
ratio = 2;
refw = (1+ost)*width;
refh = (1+ost)*height;
w = (18)*width;
wa = (15)*width;
h = (18)*height;
ha = (15)*height;

% Find the quadrant where the reference finder is located
cent(1, 1) = (markers(idxC, 1) + markers(idxX, 1) + markers(idxY, 1)) / 3;
cent(1, 2) = (markers(idxC, 2) + markers(idxX, 2) + markers(idxY, 2)) / 3;

%2 or 3
if markers(idxC, 1) < cent(1, 1)
    % 2 -- standard
    if markers(idxC, 2) < cent(1, 2)
        mode = 2;
    else
        mode = 3;
    end
%1 or 4
else
    % 1
    if markers(idxC, 2) < cent(1, 2)
        mode = 1;
    % 4
    else
        mode = 4;
    end
end

% Coordinate specification according to the reference position
if mode == 3
    Cref = [refw, refh+h];
    Xref = [refw+w, refh+h]
    Yref = [refw, refh];
    Aref = [refw+wa, refh+(h-ha)];
elseif mode == 2
    Cref = [refw, refh];
    Xref = [refw+w, refh]
    Yref = [refw, refh+h];
    Aref = [refw+wa, refh+ha];
elseif mode == 1
    Cref = [refw+w, refh];
    Xref = [refw, refh]
    Yref = [refw+w, refh+h];
    Aref = [refw+(w-wa), refh+ha];
else
    Cref = [refw+w, refh+h];
    Xref = [refw, refh+h]
    Yref = [refw+w, refh];
    Aref = [refw+(w-wa), refh+(h-ha)];
end

end

%%
% Copyright 2019 The MathWorks, Inc.