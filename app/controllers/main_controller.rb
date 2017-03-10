class MainController < ApplicationController

  def index
  end

  def backup
  end

  def getbackup
    @time = Time.now.strftime('%Y%m%d-%H%M%S')
    @filename = "backup-" + @time + ".gpg"
    p @filename

    self.response.headers["Content-Type"] ||= 'application/pgp-encrypted'
    self.response.headers["Content-Disposition"] = "attachment; filename=#{@filename}"
    self.response.headers['Last-Modified'] = Time.now.ctime.to_s

    @command = "sudo /opt/bin/backupdb.sh " + @time
    @success = system(@command);

    if @success
      @filenamewithdir = "/data/backup/" << @filename
      self.response.body = File.read(@filenamewithdir, 'rb')
    else
      redirect_to main_backup_path, alert: "Backup fehlgeschlagen!"
    end
  end
end
