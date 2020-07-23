package cn.shper.flutter.tk_logger

import cn.shper.tklogger.TKLogger
import cn.shper.tklogger.destination.TKLogBaseDestination
import cn.shper.tklogger.model.TKLogModel
import cn.shper.tklogger.thread.ThreadPoolUtils

/**
 * Author : shixupan
 * EMail : shixupan10829@hellobike.com
 * Date : 2020/7/22
 */
object TKLoggerFlutter {

  private val destinations = HashSet<TKLogBaseDestination>()

  /** Destination */
  fun addDestination(destination: TKLogBaseDestination): Boolean {
    if (destinations.contains(destination)) {
      return false
    }

    destinations.add(destination)
    return true
  }

  internal fun handlerLog(tkLog: TKLogModel) {
    ThreadPoolUtils.threadPool?.execute {
      destinations.forEach { destination ->
        destination.handlerLog(tkLog)
      }
    }
  }

}