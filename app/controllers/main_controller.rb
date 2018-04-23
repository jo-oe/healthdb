class MainController < ApplicationController

  def index
  end

  def backup
  end

  def getbackup
    respond_to do |format|
      format.gpg {
        @time = Time.now.strftime('%Y%m%d-%H%M%S')
        @filename = "backup-" + @time + ".gpg"
        p @filename

        self.response.headers["Content-Type"] ||= 'application/pgp-encrypted'
        self.response.headers["Content-Disposition"] = "attachment; filename=#{@filename}"
        self.response.headers['Last-Modified'] = Time.now.ctime.to_s

        @command = "sudo /usr/local/bin/backupdb.sh " + @time
        @success = system(@command);

        if @success
          @filenamewithdir = "/data/backup/" << @filename
          @data = File.open(@filenamewithdir, "rb") {|io| io.read}
          p @data
          self.response_body = @data
        else
          redirect_to main_backup_path, alert: "Backup fehlgeschlagen!"
        end
      }
    end
  end
end
