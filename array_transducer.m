load("DOP1AFinal.mat");
totdata = 48*48*199;
[X, Y, Z] = ndgrid(1:size(pdFinal_SVD, 1), 1:size(pdFinal_SVD, 2), 1:size(pdFinal_SVD, 3));
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
    if intensity(i, 1) < 52
        fprintf("Number at row %d = %2.4f\n", i, intensity(i));
        intensity(i, 1) = 0;
    else
        XtoPlot = [XtoPlot; X(i, 1)];
        YtoPlot = [YtoPlot; Y(i, 1)];
        ZtoPlot = [ZtoPlot; Z(i, 1)];
        intensitytoPlot = [intensitytoPlot; intensity(i, 1)];
    end
end
%% 
pointSize = 1;
%s = scatter3(X(:), Y(:), Z(:), pointSize, intensity, "filled");
%[xq, yq] = meshgrid(min(XtoPlot):max(XtoPlot), min(YtoPlot):max(YtoPlot));
%vq = griddata(XtoPlot, YtoPlot, ZtoPlot, xq, yq, "natural");
%m = mesh(xq, yq, vq);
%m.FaceColor = "#77AC30";
%m.FaceAlpha = 0.5;
%s = surf(xq, yq, vq);
%s.FaceColor = "#EDB120";
%s.EdgeColor = "none";
%hold on
s = scatter3(XtoPlot,YtoPlot, ZtoPlot, pointSize, intensitytoPlot, "filled");
hold on
%plot3(XtoPlot, YtoPlot, ZtoPlot, 'o');
%hold on
%s = surface(XtoPlot, YtoPlot, ZtoPlot, intensitytoPlot);
%ax = gca;
%T = delaunay(XtoPlot, YtoPlot, ZtoPlot);
k = boundary(XtoPlot, YtoPlot, ZtoPlot);
trisurf(k, XtoPlot, YtoPlot, ZtoPlot,"FaceColor", "#EDB120", ...
"FaceAlpha", 1,"EdgeColor", "g")
%shading interp
%shading faceted
view(-31, 14);
xlabel("x");
ylabel("y");
zlabel("z");

cb = colorbar;
