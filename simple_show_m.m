% plot for maurits
[N T]=size(normal);
[Nn Tt]=size(abnormal);
 

%reshape the data to shape 25xT, where T - number of frames
input_normal=reshape(normal', 75, N/25);
input_abnormal=reshape(abnormal, 75, Nn/25);


ankl_n=input_normal([14*3+1:14*3+3],:);
ankl_an=input_abnormal([14*3+1:14*3+3],:);


 
subplot(2,1,1);
plot(ankl_n');title('Left normal');
subplot(2,1,2);
plot(ankl_an'); title('Left abnormal');

% take left feet
%%
%%
   % for all frames
PlotData(normal);
PlotData(abnormal);