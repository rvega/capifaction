Capistrano::Configuration.instance(:must_exist).load do
  def _cset(name, *args, &block)
    unless exists?(name)
      set(name, *args, &block)
    end
  end
end
