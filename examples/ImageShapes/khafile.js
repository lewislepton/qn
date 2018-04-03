let project = new Project('image shapes - qn');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('nape');
project.addLibrary('qn');
resolve(project);