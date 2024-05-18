
    def get_all_friends_in_qq(self):

        '''
        # 获取所有qq好友基本信息
        # bkn由参数skey通过另一个加密函数得到
        bkn = hash33_bkn(self.cookies_merge_dict_in_qun_qq_com['skey'])
        submit_data = {'bkn': bkn}
        html = post_html('https://qun.qq.com/cgi-bin/qun_mgr/get_friend_list', self.cookies_merge_dict_in_qun_qq_com, submit_data)
        friend_info = loads(html.text)
        return friend_info['result']
        '''

        # 获取所有好友列表接口已失效
        return None





    def get_info_in_qq_friend(self,qq_number):

        # 获取某个qq好友的详细信息

        # 需要提交的数据
        # bkn由参数skey通过另一个加密函数得到
        bkn = hash33_bkn(self.cookies_merge_dict_in_qun_qq_com['skey'])
        submit_data = {'keyword':str(qq_number), 'ldw': str(bkn), 'num':'20', 'page':'0', 'sessionid':'0', 'agerg':'0', 'sex':'0', 'firston':'0', 'video':'0', 'country':'1', 'province':'65535', 'city':'0', 'district':'0', 'hcountry':'1', 'hprovince':'0', 'hcity':'0', 'hdistrict':'0', 'online':'0'}

        # 需要提交的cookies
        # cookies = {'uin':self.cookies_merge_dict_in_qun_qq_com['uin'], 'skey':self.cookies_merge_dict_in_qun_qq_com['skey'], 'ptisp':self.cookies_merge_dict_in_qun_qq_com['ptisp'], 'RK':self.cookies_merge_dict_in_qun_qq_com['RK'], 'ptcz':self.cookies_merge_dict_in_qun_qq_com['ptcz']}

        # 设置请求头,模拟人工
        header = {
            'Accept': 'application/json, text/javascript, */*; q=0.01',
            'Origin': 'http://find.qq.com',
            'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36',
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'Referer':'http://find.qq.com/',
        }

        # 屏蔽https证书警告
        urllib3.disable_warnings()
        # 网页访问,post方式
        html = post('http://cgi.find.qq.com/qqfind/buddy/search_v3', data=submit_data, cookies=self.cookies_merge_dict_in_qun_qq_com, headers=header, verify=False)

        # 将好友信息解析为python对象
        friend_info = loads(html.text)
        # print(friend_info)
        return friend_info['result']['buddy']['info_list'][0]



