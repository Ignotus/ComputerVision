function extract_sift()
    %% Experiment parameters
    type = 'gray';
    kp_or_dense = 'kp';

    mkdir('./Caltech4/FeatureData', 'airplanes_train');
    mkdir('./Caltech4/FeatureData', 'cars_train');
    mkdir('./Caltech4/FeatureData', 'faces_train');
    mkdir('./Caltech4/FeatureData', 'motorbikes_train');
    
    mkdir('./Caltech4/FeatureData', 'airplanes_test');
    mkdir('./Caltech4/FeatureData', 'cars_test');
    mkdir('./Caltech4/FeatureData', 'faces_test');
    mkdir('./Caltech4/FeatureData', 'motorbikes_test');

    fid = fopen('./Caltech4/ImageSets/train.txt');
    tline = fgetl(fid);
    while ischar(tline)
        %disp(tline)
        tline = fgetl(fid);
        folder = strsplit(tline, '/');
        file_name = folder(2)
        folder = folder(1)
        %[class, ~] = strsplit(folder, '_');
        features = feature_extraction(strcat('./Caltech4/ImageData/', tline, '.jpg'), type, kp_or_dense);
        output_file = strcat('./Caltech4/FeatureData/', folder, '/', type, '_', kp_or_dense, '_', file_name, '.mat')
        
        if exist(output_file{1}, 'file') == 0
            save(output_file{1}, 'features');
        end
    end
    fclose(fid);
end

