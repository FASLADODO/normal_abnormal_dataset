function [] = BDD(folder)

    d=dir(folder);

    [lg, ~]=size(d);
    for i=3:lg
        if d(i).isdir==1
            adresse=[folder '\' d(i).name]; %go to the first subfolder
            save_str={};
            disp(adresse);
            subfolder=dir(adresse);
           
            %adresse=[adresse '\' subfolder(3).name]; % NEEDED for test
            % here the sequences are
            sequences = dir(adresse)
            [num_seq, ~]=size(sequences);
            for j=3:num_seq
                addresse=[adresse  '\' sequences(j).name]; %go to the first subfolder
                sub_test=dir(addresse);
                addresse=[addresse '\' sub_test(3).name];
                XYZ = GetDataXYZ(addresse);
                save_str{j-2} = XYZ;
            end
                       
        end
    end

end