let project = new Project('listen collide sensor - qn');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('nape');
project.addLibrary('qn');
resolve(project);