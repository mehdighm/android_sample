clc;clear;close('all');
ps='F:\Dr_sajadi_Study_area\ndvi_new_d\mat_sensor_ed\';
pi='F:\Dr_sajadi_Study_area\Hants_result\';
p2='F:\Dr_sajadi_Study_area\ndvi_new_d\ALL_ed\po_Hants_WD_ed\';
CR=nan(666,5);mae=CR;RMSE=mae;mse=RMSE;N=2;
Si=CR;Me=CR;SNR=CR;  PSNR=CR;
% %   [ti_y,ti_m,ti_d,MOD,MYD,Avhrr,L7,L7p,L8,L8p];
%str_i={'MOD','MYD','Avhrr','L7','L7p','L8','L8p'};
% %   [ 1  , 2  , 3  , 4 , 5 , 6   , 7, 8 , 9, 10]
str_i={'MOD','MYD','Avhrr','L7','L8'};

Int=[16,16,4,16,8,16,8];
kk=[6 7 8 16 17 19 20];
ini=[7 18 20];
for k=ini
    jdii=[];nd=[];
    load(strcat(ps,'Pi_ALL_ed',num2str(k),'.mat'))
    
    jdi{1}=jd_mod;jdi{2}=jd_myd;jdi{3}=jd_av;jdi{4}=jd_L7;jdi{5}=jd_L8;
    ndi{1}=nd_mod;ndi{2}=nd_myd;ndi{3}=nd_av*0.0001;ndi{4}=nd_L7;ndi{5}=nd_L8;
    
    for j=1:5
        ndvik=ndi{j};t1=jdi{j};
        i1=isnan(ndvik);ndvik(i1)=[];t1(i1)=[];
        i1=find(ndvik<0.1);ndvik(i1)=[];t1(i1)=[];
        L_ij(k,j)=length(ndvik);
        [t1,i1]=sort(t1);ndvik=ndvik(i1);
        ndvik=ndvik(:);t1=t1(:);
        wname='db9';
         try
            [mse(k,j),mae(k,j),RMSE(k,j),CR(k,j),ti,ND,y3,kj,c,tgii,nd_Htgii]=Wavelet_PhaseShift(k,Int(j),t1,ndvik,wname,N,str_i{j});
%             if length(nd_Htgii)>20
                
                tikk=[tgii(:);t1(:)];
                fg1 = figure('Position',[5 106 1366 500]);
                axes1 = axes('Parent',fg1,'FontWeight','bold','FontSize',16);box(axes1,'on');hold(axes1,'on');
                plot(tgii,nd_Htgii,'r.','MarkerSize',15);hold on;plot(ti,y3,'LineWidth',3);
                plot(t1,ndvik,'k','LineWidth',1);
                xlim([min(tikk)-1 max(tikk)+1 ])
                title(strcat(str_i{j},'--',num2str(k)));
                saveas(fg1,strcat(p2,str_i{j},'_Po_',num2str(k),'.tif'),'tiff');
                saveas(fg1,strcat(p2,str_i{j},'_Po_',num2str(k),'.fig'),'fig');
                xlim([2013.7 2015.2])
                saveas(fg1,strcat(p2,str_i{j},'_Po_',num2str(k),'_Z.tif'),'tiff');

                close(fg1);
%             end
            
            
            
%             [m,s] = normfit(y3-ND);
%             Si(k,j)=s;Me(k,j)=m;
            n1=length(y3);
            RMSE(k,j)=((1/n1)*sum((y3-ND).^2))^0.5;
            [mse(k,j),mae(k,j),SNR(k,j),PSNR(k,j),CR(k,j)] = evaluate_denoising_metrics(y3,ND);
        catch
                    disp(strcat('err==> po:',num2str(k),', j:',num2str(j)))

        end
        
    end
    disp(num2str(k))
end

bv




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
