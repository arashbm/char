moment.lang 'fa',
  months: "janvier_février_mars_avril_mai_juin_juillet_août_septembre_octobre_novembre_décembre".split("_")
  monthsShort: "janv._févr._mars_avr._mai_juin_juil._août_sept._oct._nov._déc.".split("_")
  weekdays: "dimanche_lundi_mardi_mercredi_jeudi_vendredi_samedi".split("_")
  weekdaysShort: "dim._lun._mar._mer._jeu._ven._sam.".split("_")
  weekdaysMin: "Di_Lu_Ma_Me_Je_Ve_Sa".split("_")
  longDateFormat:
    LT: "HH:mm"
    L: "DD/MM/YYYY"
    LL: "D MMMM YYYY"
    LLL: "D MMMM YYYY LT"
    LLLL: "dddd D MMMM YYYY LT"
  calendar:
    sameDay: "[امروز ساعت] LT"
    nextDay: '[فردا ساعت] LT'
    nextWeek: 'dddd [ساعت] LT'
    lastDay: '[دیروز ساعت] LT'
    lastWeek: 'dddd [گذشته در] LT'
    sameElse: 'L'
  relativeTime:
    future: "%s دیگر"
    past: "%s پیش"
    s: "چند ثانیه"
    m: "یک دقیقه"
    mm: "%d دقیقه"
    h: "یک ساعت"
    hh: "%d ساعت"
    d: "یک روز"
    dd: "%d روز"
    M: "یک ماه"
    MM: "%d ماه"
    y: "یک سال"
    yy: "%d سال"
  ordinal: (number) -> number + 'ام'
  week :
    dow : 6
    doy : 85
