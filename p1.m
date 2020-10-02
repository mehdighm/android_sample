%         fg1 = figure('Position',[5 106 1366 500]);
%      axes1 = axes('Parent',fg1,'FontWeight','bold','FontSize',16);box(axes1,'on');hold(axes1,'on');
%         plot(t1,ndvik,'b.','MarkerSize',10);hold on;plot(t1,ndvik,'b','LineWidth',0.6);
%         plot(ti,y3,'r','LineWidth',1.5);    s2=strcat('Po=[',num2str(po_Modis(k,1)),',',num2str(po_Modis(k,2)),']');
%         title(strcat(s2,'--',wname,'--poN=',num2str(j2)));
% % pause(1)
% saveas(fg1,strcat(p2,'Po_',num2str(k),'_',wname,'.tif'),'tiff');
%
%         close(fg1);

%     catch
% end
%         fg1 = figure('Position',[5 106 1366 500]);axes1 = axes('Parent',fg1,'FontWeight','bold','FontSize',16);box(axes1,'on');hold(axes1,'on');
%         plot(ti,ND,'r.','MarkerSize',10);hold on;plot(ti,y3,'b','LineWidth',0.6);
%         s2=strcat('P',num2str(id(k)),',[',num2str(ind(k,3)),',',num2str(ind(k,4)),']');
%         title(s2);
%         xlim([min(ti)-1 max(ti)+1])
%         saveas(fg1,strcat(ps,'P',num2str(id(k)),'.tif'),'tiff');
%          saveas(fg1,strcat(ps,'P',num2str(id(k)),'.fig'),'fig');
% close(fg1);
% Plot_fig_Ndvi([ti ti],[ND y3],strcat('Pi-',num2str(k),'-',str_i{j}),pi)
