include_attribute "ntp::default"

default[:ntp][:servers] = ["ntp1.jst.mfeed.ad.jp", "ntp2.jst.mfeed.ad.jp", "ntp3.jst.mfeed.ad.jp"]
default[:ntp][:restrictions] = ["10.0.0.0 mask 255.0.0.0 nomodify notrap"]
