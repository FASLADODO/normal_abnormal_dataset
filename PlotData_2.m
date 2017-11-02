function PlotData( XYZ, XYZ_ideal)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
static=0;
 for k= 1: (size(XYZ,1)/25)
            
            td=XYZ((k-1)*25+1:k*25,:);
            td_st=XYZ_ideal((k-1)*25+1:k*25,:);
            if(static==1)
                td = td - repmat(td(1,:),[25,1]);
                td_st = td_st-repmat(td_st(1,:),[25,1]);
                
            end
            
            clf;
            axis([-2 2 -3 3 -2 2]);
            view([-170, -50]); %  
            hold on
            scatter3(td(:,1),td(:,2),td(:,3),'.');
            scatter3(td_st(:,1),td_st(:,2),td_st(:,3), 'MarkerEdgeColor',[0 1 0]);
            grid on
            
                  
                     pause(0.2);
        end
        






end

