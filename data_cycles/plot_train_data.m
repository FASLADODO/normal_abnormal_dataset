function [train_for_model] = plot_train_data( )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% align the data using the dtw
coeff_res=50;
train=load('final_for_training.mat');
train=train.final_for_test;
persons=fieldnames(train);
train_for_model=[];
            %reshape the data to shape 25xT, where T - number of frames
            num_persons=numel(persons);
        figure(3); hold on 
        figure(1); hold on
        figure(2); hold on
        figure(4); hold on
        figure(5); hold on
        figure(6); hold on 
        figure(7); hold on
        figure(8); hold on
        figure(9); hold on

        
        
for ii=1:num_persons
%for each person
    person=train.(persons{ii});
    disfucntions=size(person,2);
   
    for k=1:disfucntions
    disf=person{k};
        for j=1:size(disf,2)
             data=disf{j};
             % reshape data into a normal dimisions
             [N T]=size(data);
            %reshape the data to shape 25xT, where T - number of frames
             joints_data=reshape(data', 75, N/25);
             [ign t]=size(joints_data);
             selected_joints=joints_data([14*3+1:14*3+3, 12*3+1:12*3+3, 13*3+1:13*3+3, 15*3+1:15*3+3, 3*3+1:3*3+3, 19*3+1:19*3+3, 17*3+1:17*3+3,  16*3+1:16*3+3,  18*3+1:18*3+3],:); %take only left ankle, right ankle, left foot, right foot, l hip, r hip, l knee, r knee, mid spine          
           
             coeff_data=size(selected_joints,2);
             selected_joints = (resample( selected_joints',coeff_res,coeff_data))';
             figure(1)
             M=plot(selected_joints(1:3,:)');           % line plot
             set(M, {'color'}, {[1 0 0];[0 1 0];[0 0 1]});
             suptitle('Left ankle normal')
             figure(2)
             M=plot(selected_joints(4:6,:)');
             set(M, {'color'}, {[1 0 0];[0 1 0];[0 0 1]});
             suptitle('Left hip normal');
             figure(3)
             M=plot(selected_joints(7:9,:)');
             set(M, {'color'}, {[1 0 0];[0 1 0];[0 0 1]});
             suptitle('Left knee normal');
             figure(4)
             M=plot(selected_joints(10:12,:)');
             set(M, {'color'}, {[1 0 0];[0 1 0];[0 0 1]});
             suptitle('Left foot normal');
             figure(5)
             M=plot(selected_joints(13:15,:)');
             set(M, {'color'}, {[1 0 0];[0 1 0];[0 0 1]});
             suptitle('Neck normal');
             figure(6)
             M=plot(selected_joints(16:18,:)');
             set(M, {'color'}, {[1 0 0];[0 1 0];[0 0 1]});
             suptitle('Right foot normal');
             figure(7)
             M=plot(selected_joints(19:21,:)');
             set(M, {'color'}, {[1 0 0];[0 1 0];[0 0 1]});
             suptitle('Right knee normal');
             figure(8)
             M=plot(selected_joints(22:24,:)');
             set(M, {'color'}, {[1 0 0];[0 1 0];[0 0 1]});
             suptitle('Right hip normal');
             figure(9)
             M=plot(selected_joints(25:27,:)');
             set(M, {'color'}, {[1 0 0];[0 1 0];[0 0 1]});
             suptitle('Right ankle normal');
             
             
             
             train_for_model=[train_for_model, selected_joints];
         end
    end

end



end

