function v = prepVidObject(filename,framerate)
v = VideoWriter(filename);
v.FrameRate = framerate;
end