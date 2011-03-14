module Zero2
  def zero2
    (self / 10.0).to_s.gsub('.', '')
  end
end

class Fixnum
  include Zero2
end


class Float
  include Zero2
  def to_hh_mm_ss
    mm, ss = self.divmod(60)
    hh, mm = mm.divmod(60)
    "#{hh.zero2}:#{mm.zero2}:#{ss.zero2}"
  end
end

class String
  def to_sec
    h, m, s = self.split(':', 3).map {|e| e.to_f}
    h*3600 + m*60 + s
  end
end

