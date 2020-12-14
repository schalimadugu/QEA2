[MotionData]=ParseMatlabApp('150bpm-run.mat')
makeAccelerometerPlots([MotionData.t_Accel,MotionData.Accel])

figure
match_song_final(MotionData.Accel(:,1), MotionData.Accel(:,2), MotionData.Accel(:,3), 10)