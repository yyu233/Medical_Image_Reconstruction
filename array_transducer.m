load("DOP1AFinal.mat");
totdata = 48*48*199;
[X, Y, Z] = ndgrid(1:size(pdFinal_SVD, 1), 1:size(pdFinal_SVD, 2), 1:size(pdFinal_SVD, 3));
pointSize = 40;
%intensity = reshape(pdFinal_SVD, [1, totdata]);
X = X(:);
Y = Y(:);
Z = Z(:);
intensity = pdFinal_SVD(:);
XtoPlot = double.empty;
YtoPlot = double.empty;
ZtoPlot = double.empty;
intensitytoPlot = double.empty;
for i = 1:totdata
    if intensity(i, 1) < 55
        fprintf("Number at row %d = %2.4f\n", i, intensity(i));
        intensity(i, 1) = 0;
    else
        XtoPlot = [XtoPlot; X(i, 1)];
        YtoPlot = [YtoPlot; Y(i, 1)];
        ZtoPlot = [ZtoPlot; Z(i, 1)];
        intensitytoPlot = [intensitytoPlot; intensity(i, 1)];
    end
end
%s = scatter3(X(:), Y(:), Z(:), pointSize, intensity, "filled");
s = scatter3(XtoPlot,YtoPlot, ZtoPlot, pointSize, intensitytoPlot, "filled");
%ax = gca;
view(-31, 14);
xlabel("x");
ylabel("y");
zlabel("z");

cb = colorbar;
