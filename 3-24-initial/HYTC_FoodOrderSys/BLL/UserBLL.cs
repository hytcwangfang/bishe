using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class UserBLL
    {
        /// <summary>
        /// 获取所有用户信息
        /// </summary>
        /// <returns></returns>
        public List<Model.UserInfo> GetAllUserInfo() {
            DAL.UserDAL userlist = new DAL.UserDAL();
            return userlist.GetAllUserInfo();
        }
    }
}
