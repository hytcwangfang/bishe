using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class UserInfo
    {
        /// <summary>
        /// 用户头像
        /// </summary>
        public string UserImg { get; set; }

        /// <summary>
        /// 用户昵称
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// 用户密码
        /// </summary>
        public string UserPwd { get; set; }

        /// <summary>
        /// 性别
        /// </summary>
        public string UserGender { get; set; }

        /// <summary>
        /// 年龄
        /// </summary>
        public int UserAge { get; set; }

        /// <summary>
        /// 生日
        /// </summary>
        public string UserBirth { get; set; }

        /// <summary>
        /// 用户状态编号
        /// </summary>
        public int UserStateId { get; set; }

        /// <summary>
        /// 用户手机号（主键）
        /// </summary>
        public string UserPhone { get; set; }

        /// <summary>
        /// 用户地址
        /// </summary>
        public string UserAddress { get; set; }

        /// <summary>
        /// 用户QQ
        /// </summary>
        public string UserQQ { get; set; }

        /// <summary>
        /// 用户邮件地址
        /// </summary>
        public string UserMail { get; set; }

        /// <summary>
        /// 用户积分
        /// </summary>
        public int UserScore { get; set; }

        /// <summary>
        /// 用户等级
        /// </summary>
        public int UserLevel { get; set; }

        /// <summary>
        /// 用户信誉度值
        /// </summary>
        public int UserFaith { get; set; }
    }
}
