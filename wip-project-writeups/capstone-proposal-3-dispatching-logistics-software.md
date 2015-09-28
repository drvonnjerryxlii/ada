
## capstone proposal 3: Dispatching / logistics software ##

old notes:

This is something I have been considering almost since I started my current job with Indy Stealth Logistics. They are using an old order entry program that doesn't handle driver communication, order sorting, or invoicing very well (at least compared to other, more modern pieces of software). My boss, Stace, has been talking about upgrading it for months. He has another piece of software to try out, but he does not like it so far and is exploring his other options. I would sort of like to write this as a parting gift for Stace as well as a massive learning experience for me. It is an order entry / dispatching logistics program.

> #### Order entry ####

* Suggest delivery address, customer name, (customer reference code if standard like FAT?), while typing.
* Easy swap pickup/delivery like now.
* Bring up last order (like PH did?).
* Integrate caller ID?
* Sort customer, destination, pickup, due time, order time (ticket #), driver, order taker.
* Track modifications? (Who opened this & changed stuff?)


> #### Phone paging system ####

* !P Would have to figure out why T-mobile glitches.
* Phone signing like FedEx / Square type thing - can take time of delivery from phone.
* Auto insert proof of delivery info if no conflicts.
* Driver page/accept job like Postmates?

> #### Invoicing ####

* !P How invoicing works now?
* Different summary modes.
   * Customization.
      * Set per client or let client decide?
   * Itemized per order, just list total orders, etc.
* Special bookkeeping some clients (eg FID)?
   * Integrate w/ Quicken/QuickBooks?
   * Monthly, weekly, daily, and per order invoicing options?
* Definitely freeze all after invoice.


> #### Customer views ####

* Watch job in action?
* Preview invoice? (Preview individual orders & charges?)
* Review individual orders & charges (eg, residence, wait time, size)?
