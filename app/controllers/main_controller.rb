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
      response.body = File.read('/data/backup/'+@filename, 'rb')
    else
      redirect_to action: backup, alert: "Backup fehlgeschlagen!"
    end
  end
end
