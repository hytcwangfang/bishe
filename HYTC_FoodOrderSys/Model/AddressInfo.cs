using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class AddressInfo
    {
        //addid userphone recename addrdes isdefault
        public int AddressId { get; set; }
        public string UserPhone { get; set; }
        public string ReceiveName { get; set; }
        public string AddressDes { get; set; }
        public string IsDefault { get; set; }
    }
}
