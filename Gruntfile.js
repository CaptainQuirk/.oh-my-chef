module.exports = function (grunt) {

  // Project configuration
  grunt.initConfig({

      // Watching project content changes
      // Both sections allow the watch of any file
      // inside both directories, recursively (** means « at any
      // place in the tree »
    watch: {
      "queued_scripts": {
          files: [ "scripts_tank/**/*" ],
          tasks: [ "exec:execute" ]
      } 
    },
    exec: {
      execute : {
        command: 'sh **',
        stdout: false,
        stderr: false
      }
    }
  });

  // Loading plugins. They have to be loaded one at a time
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-exec');

  grunt.registerTask('default', 'watch');
};
