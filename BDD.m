function [] = BDD(folder)

    d=dir(folder);
    data_save=struct; % structure qui va contenir les informations
    [lg, ~]=size(d);
    for i=3:lg
        if d(i).isdir==1
            adresse=[folder '\' d(i).name]; %go to the first subfolder
            save_str={};
            disp(adresse);
            subfolder=dir(adresse);
            
            %adresse=[adresse '\' subfolder(3).name]; % NEEDED for test
            % here the sequences are
            sequences = dir(adresse);
            [num_seq, ~]=size(sequences);
            for j=3:num_seq
                addresse=[adresse  '\' sequences(j).name]; %go to the first subfolder
                sub_test=dir(addresse);
                for dd=3:size(sub_test)
                    addr=[addresse '\' sub_test(dd).name];
                    XYZ = GetDataXYZ(addr);
                    save_str{dd-2} = XYZ;
                end
               
            end
            [data_save.(d(i).name)]=save_str;          
        end
    end
save('testing.mat', 'data_save');
end