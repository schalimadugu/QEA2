function [accel, gyro, attitude] = parsePowerSenseData(filename)
    function userAccClean = cleanData(timestampsDesired, timestampsOrig, userAcc)
        cleanInds = ~isnan(userAcc);
        userAccClean = interp1(timestampsOrig(cleanInds), userAcc(cleanInds), timestampsDesired);
    end
    function cleaned = interpolateMissingValues(X)
        time = X(:,1);
        timestampsDesired = linspace(time(1), time(end), length(time));
        cleaned = zeros(size(X));
        cleaned(:,1) = timestampsDesired;
        for i = 2 : size(X,2)
            cleaned(:,i) = cleanData(timestampsDesired, X(:,1), X(:,i));
        end
    end
   data = importdata(filename);
   userAccInds = [];
   userAccInds(end+1) = find(strcmp(data.textdata, 'user_acc_x(G)'));
   userAccInds(end+1) = find(strcmp(data.textdata, 'user_acc_y(G)'));
   userAccInds(end+1) = find(strcmp(data.textdata, 'user_acc_z(G)'));
   gravityInds = [];

   gravityInds(end+1) = find(strcmp(data.textdata, 'gravity_x(G)'));
   gravityInds(end+1) = find(strcmp(data.textdata, 'gravity_y(G)'));
   gravityInds(end+1) = find(strcmp(data.textdata, 'gravity_z(G)'));

   gyroInds = [];
   gyroInds(end+1) = find(strcmp(data.textdata, 'rotation_rate_x(radians/s)'));
   gyroInds(end+1) = find(strcmp(data.textdata, 'rotation_rate_y(radians/s)'));
   gyroInds(end+1) = find(strcmp(data.textdata, 'rotation_rate_z(radians/s)'));

   attitudeInds = [];
   attitudeInds(end+1) = find(strcmp(data.textdata, 'attitude_yaw(radians)'));
   attitudeInds(end+1) = find(strcmp(data.textdata, 'attitude_pitch(radians)'));
   attitudeInds(end+1) = find(strcmp(data.textdata, 'attitude_roll(radians)'));
   data.textdata{4}
   
   timeinds = find(strcmp(data.textdata, 'timestamp(unix)'));
   % some of the time columns are all NaNs for some reason
   if length(timeinds) == 1
       best = 1;
   else
       [~, best] = max(sum(~isnan(data.data(:,timeinds))));
   end
   bestTimeInd = timeinds(best);
   startInd = min(find(~isnan(data.data(:,bestTimeInd))));
   data.data = data.data(startInd:end,:);
   % iOS measures in units of gravities.  We need to multiply by -9.8 to
   % ensure that the signs match up between iOS and Android
   accel = [data.data(:,bestTimeInd) -9.8*(data.data(:,userAccInds) + data.data(:, gravityInds))];
   gyro = [data.data(:,bestTimeInd) data.data(:,gyroInds)];
   attitude = [data.data(:,bestTimeInd) rad2deg(data.data(:, attitudeInds))];
   
   accel = interpolateMissingValues(accel);
   gyro = interpolateMissingValues(gyro);
   attitude = interpolateMissingValues(attitude);
end