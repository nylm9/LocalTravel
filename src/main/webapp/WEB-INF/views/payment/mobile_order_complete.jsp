<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%!
    /* 
    ==========================================================================
    null ���� ó���ϴ� �޼ҵ�                                                               
    --------------------------------------------------------------------------
    */
    public String f_get_parm( String val )
    {
        if ( val == null ) val = "";
        return  val;
    }
    /* ============================================================================== */
%>
<%
    request.setCharacterEncoding( "euc-kr" );
    
    // �ŷ���� ���� ��
    String approvalKey = f_get_parm( request.getParameter( "approvalKey"    ) ); // �ŷ����Ű
    String traceNo     = f_get_parm( request.getParameter( "traceNo"        ) ); // ������ȣ
    String PayUrl      = f_get_parm( request.getParameter( "PayUrl"         ) ); // �ŷ���� PAY URL
    // ������ �ʿ��� �������� ���� ��
    String pay_method   = f_get_parm( request.getParameter( "pay_method"   ) ); // ��������
    String actionResult = f_get_parm( request.getParameter( "actionResult" ) );
    String van_code     = f_get_parm( request.getParameter( "van_code" ) );
    // ������ ���� URL
    String Ret_URL      = f_get_parm( request.getParameter( "Ret_URL"     ) ); 

    /* kcp��  ���� ����� kcp �������� ���۵Ǵ� ���� ��û ���� */
    String req_tx          = f_get_parm( request.getParameter( "req_tx"         ) ); // ��û ����         
    String res_cd          = f_get_parm( request.getParameter( "res_cd"         ) ); // ���� �ڵ�
    String site_cd         = f_get_parm( request.getParameter( "site_cd"        ) ); // ����Ʈ�ڵ�       
    String tran_cd         = f_get_parm( request.getParameter( "tran_cd"        ) ); // Ʈ����� �ڵ�     
    String ordr_idxx       = f_get_parm( request.getParameter( "ordr_idxx"      ) ); // ���θ� �ֹ���ȣ   
    String good_name       = f_get_parm( request.getParameter( "good_name"      ) ); // ��ǰ��            
    String good_mny        = f_get_parm( request.getParameter( "good_mny"       ) ); // ���� �ѱݾ�       
    String buyr_name       = f_get_parm( request.getParameter( "buyr_name"      ) ); // �ֹ��ڸ�          
    String buyr_tel1       = f_get_parm( request.getParameter( "buyr_tel1"      ) ); // �ֹ��� ��ȭ��ȣ   
    String buyr_tel2       = f_get_parm( request.getParameter( "buyr_tel2"      ) ); // �ֹ��� �ڵ��� ��ȣ
    String buyr_mail       = f_get_parm( request.getParameter( "buyr_mail"      ) ); // �ֹ��� E-mail �ּ�
    String use_pay_method  = f_get_parm( request.getParameter( "use_pay_method" ) ); // ���� ���          
    String enc_info        = f_get_parm( request.getParameter( "enc_info"       ) ); // ��ȣȭ ����       
    String enc_data        = f_get_parm( request.getParameter( "enc_data"       ) ); // ��ȣȭ ������     
    String cash_yn         = f_get_parm( request.getParameter( "cash_yn"        ) );
    String cash_tr_code    = f_get_parm( request.getParameter( "cash_tr_code"   ) );
    /* ��Ÿ �Ķ���� �߰� �κ� - Start - */
    String param_opt_1    = f_get_parm( request.getParameter( "param_opt_1"     ) ); // ��Ÿ �Ķ���� �߰� �κ�
    String param_opt_2    = f_get_parm( request.getParameter( "param_opt_2"     ) ); // ��Ÿ �Ķ���� �߰� �κ�
    String param_opt_3    = f_get_parm( request.getParameter( "param_opt_3"     ) ); // ��Ÿ �Ķ���� �߰� �κ�
    /* ��Ÿ �Ķ���� �߰� �κ� - End -   */

%>

<!DOCTYPE>
<html>
<head>
    <title>*** NHN KCP API SAMPLE ***</title>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi">  
    <link href="${pageContext.request.contextPath }/resources/css/paymentStyle.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        /* kcp web ����â ȣ�� (����Ұ�) */
        function call_pay_form()
        {
            var v_frm = document.order_info;
            var PayUrl = v_frm.PayUrl.value;
            // ���ڵ� ��Ŀ� ���� ���� -- Start
            if(v_frm.encoding_trans == undefined)
            {
                v_frm.action = PayUrl;
            }
            else
            {
                // encoding_trans "UTF-8" �� ���
                if(v_frm.encoding_trans.value == "UTF-8")
                {
                    v_frm.action = PayUrl.substring(0,PayUrl.lastIndexOf("/"))  + "/jsp/encodingFilter/encodingFilter.jsp";
                    v_frm.PayUrl.value = PayUrl;
                }
                else
                {
                    v_frm.action = PayUrl;
                }
            }
        
            if (v_frm.Ret_URL.value == "")
            {
                /* Ret_URL���� �� �������� URL �Դϴ�. */
                alert("������ Ret_URL�� �ݵ�� �����ϼž� �˴ϴ�.");
                return false;
            }
            else
            {
                v_frm.submit();
            }
        }
        
        /* kcp ����� ���� ���� ��ȣȭ ���� üũ �� ���� ��û (����Ұ�) */
        function chk_pay()
        {
            self.name = "tar_opener";
            var pay_form = document.pay_form;
            
            if (pay_form.res_cd.value != "" )
            {   
                if (pay_form.res_cd.value != "0000" )
                {
                    if (pay_form.res_cd.value == "3001")
                    {
                        alert("����ڰ� ����Ͽ����ϴ�.");
                    }
                    pay_form.res_cd.value = "";
                    location.href = "./trade_reg.html"; // ���ÿ����� �ŷ���� �������� �̵�
                }
            }
            if (pay_form.enc_info.value)
                pay_form.submit();
        }
    </script>
</head>
<body onload="chk_pay();">
    <div class="wrap">

        <!-- �ֹ����� �Է� form : order_info -->
        <form name="order_info" method="post">
            <!-- header -->
            <div class="header">
                <a href="../index.html" class="btn-back"><span>�ڷΰ���</span></a>
                <h1 class="title">�ֹ�/���� SAMPLE</h1>
            </div>
            <!-- //header -->
            <!-- contents -->
            <div id="skipCont" class="contents">
                <p class="txt-type-1">�� �������� �ŷ���� �Ϸ� �� �ֹ� ��û�ϴ� ���� �������Դϴ�.</p>
                <p class="txt-type-2">�ҽ� ���� �� [�� �ʼ�] �Ǵ� [�� �ɼ�] ǥ�ð� ���Ե� ������ �������� ��Ȳ�� �°� ������ ���� �����Ͻñ� �ٶ��ϴ�.</p>
                <!--
                    ==================================================================
                        1. �ֹ����� �Է�                                                       
                    ------------------------------------------------------------------
                    ������ �ʿ��� �ֹ� ������ �Է� �� �����մϴ�.                           
                    ------------------------------------------------------------------
                -->
                <!-- �ֹ����� -->
                <h2 class="title-type-3">�ֹ�����</h2>
                <ul class="list-type-1">
                    <!-- �ֹ���ȣ(ordr_idxx) -->
                    <li>
                        <div class="left"><p class="title">�ֹ���ȣ</p></div>
                        <div class="right">
                            <div class="ipt-type-1 pc-wd-2">
                                <input type="text" name="ordr_idxx" value="<%=ordr_idxx %>" maxlength="40" readonly />
                            </div>
                        </div>
                    </li>
                    <!-- ��ǰ��(good_name) -->
                    <li>
                        <div class="left"><p class="title">��ǰ��</p></div>
                        <div class="right">
                            <div class="ipt-type-1 pc-wd-2">
                                <input type="text" name="good_name" value="<%=good_name %>" readonly />
                            </div>
                        </div>
                    </li>
                    <!-- �����ݾ�(good_mny) - �� �ʼ� : �� ������ ,(�޸�)�� ������ ���ڸ� �Է��Ͽ� �ֽʽÿ�. -->
                    <li>
                        <div class="left"><p class="title">��ǰ�ݾ�</p></div>
                        <div class="right">
                            <div class="ipt-type-1 gap-2 pc-wd-2">
                                <input type="text" name="good_mny" value="<%=good_mny %>" maxlength="9" readonly />
                                <span class="txt-price">��</span>
                            </div>
                        </div>
                    </li>
                    <!-- �ֹ��ڸ�(buyr_name) -->
                    <li>
                        <div class="left"><p class="title">�ֹ��ڸ�</p></div>
                        <div class="right">
                            <div class="ipt-type-1 pc-wd-2">
                                <input type="text" name="buyr_name" value="ȫ�浿" />
                            </div>
                        </div>
                    </li>
                    <!-- �ֹ��� ����ó1(buyr_tel1) -->
                    <li>
                        <div class="left"><p class="title">��ȭ��ȣ</p></div>
                        <div class="right">
                            <div class="ipt-type-1 pc-wd-2">
                                <input type="text" name="buyr_tel1" value="02-0000-0000" />
                            </div>
                        </div>
                    </li>
                    <!-- �޴�����ȣ(buyr_tel2) -->
                    <li>
                        <div class="left"><p class="title">�޴�����ȣ</p></div>
                        <div class="right">
                            <div class="ipt-type-1 pc-wd-2">
                                <input type="text" name="buyr_tel2" value="010-0000-0000" />
                            </div>
                        </div>
                    </li>
                    <!-- �ֹ��� E-mail(buyr_mail) -->
                    <li>
                        <div class="left"><p class="title">�̸���</p></div>
                        <div class="right">
                            <div class="ipt-type-1 pc-wd-2">
                                <input type="text" name="buyr_mail" value="test@test.co.kr" />
                            </div>
                        </div>
                    </li>
                </ul>
                <div Class="Line-Type-1"></div>
                <ul class="list-btn-2">
                    <li class="pc-only-show"><a href="../index.html" class="btn-type-3 pc-wd-2">�ڷ�</a></li>
                    <li><a href="#none" onclick="call_pay_form();" class="btn-type-2 pc-wd-3">������û</a></li> 
                </ul>
            </div>
            <!-- //contents -->

            <!-- footer -->
            <div class="grid-footer">
                <div class="inner">
                    <div class="footer">
                        �� NHN KCP Corp.
                    </div>
                </div>
            </div>
            <!--//footer-->
            <!-- �������� -->
            <input type="hidden" name="req_tx"          value="pay" />              <!-- ��û ���� -->
            <input type="hidden" name="shop_name"       value="TEST SITE" />        <!-- ����Ʈ �̸� --> 
            <input type="hidden" name="site_cd"         value="<%=site_cd %>" />    <!-- ����Ʈ �ڵ� -->
            <input type="hidden" name="currency"        value="410"/>               <!-- ��ȭ �ڵ� -->
            <!-- ������ �ʿ��� �Ķ����(����Ұ�)-->
            <input type="hidden" name="escw_used"       value="N" />
            <input type="hidden" name="pay_method"      value="<%=pay_method %>" />
            <input type="hidden" name="ActionResult"    value="<%=actionResult %>" />
            <input type="hidden" name="van_code"        value="<%=van_code %>" />
            <!-- �ſ�ī�� ���� -->
            <input type="hidden" name="quotaopt"        value="12"/> <!-- �ִ� �Һΰ����� -->
            <!-- ������� ���� -->
            <input type="hidden" name="ipgm_date"       value="" />
            <!-- ���� URL (kcp�� ����� ������ ��û�� �� �ִ� ��ȣȭ �����͸� ���� ���� �������� �ֹ������� URL) -->
            <input type="hidden" name="Ret_URL"         value="<%=Ret_URL %>" />
            <!-- ȭ�� ũ������ -->
            <input type="hidden" name="tablet_size"     value="1.0 " />
            <!-- �߰� �Ķ���� ( ���������� ������ �����޽� param_opt �� ����Ͽ� �� ���� ) -->
            <input type="hidden" name="param_opt_1"     value="" />
            <input type="hidden" name="param_opt_2"     value="" />
            <input type="hidden" name="param_opt_3"     value="" />
            <!-- �ŷ���� ���䰪 -->
            <input type="hidden" name="approval_key" id="approval" value="<%=approvalKey%>"/>
            <input type="hidden" name="traceNo"                    value="<%=traceNo%>" />
            <input type="hidden" name="PayUrl"                     value="<%=PayUrl%>" />
            <!-- ����â ȣ�� �� �ѱ۱��� ��� encoding ó�� �߰� (**���ڵ� ������ �빮��) 
            <input type="hidden" name="encoding_trans" value="UTF-8" />  -->
            
            <!-- 
            =======================================
             �ɼ� ����                                                               
            --------------------------------------
              �� �ɼ� - ������ �ʿ��� �߰� �ɼ� ������ �Է� �� �����մϴ�.
            --------------------------------------
            -->
            <!--  ī��� ����Ʈ ����
            ��) ��ī��� ����ī�� ��� ������ -->
            <!-- <input type="hidden" name="used_card"    value="CCBC:CCLG"> -->
            <!-- ������ �ɼ�
                    �� �����Һ�    (������ ������ �������� ���� �� ������ ������ ������) - "" �� ����
                    �� �Ϲ��Һ�    (KCP �̺�Ʈ �̿ܿ� ���� �� ��� ������ ������ �����Ѵ�) - "N" �� ����
                    �� ������ �Һ� (������ ������ �������� ���� �� ������ �̺�Ʈ �� ���ϴ� ������ ������ �����Ѵ�)   - "Y" �� ����  -->
            <!-- <input type="hidden" name="kcp_noint"       value=""/> --> 
            <!-- ������ ����
                    �� ���� 1 : �Һδ� �����ݾ��� 50,000 �� �̻��� ��쿡�� ����
                    �� ���� 2 : ������ �������� ������ �ɼ��� Y�� ��쿡�� ���� â�� ����
                    ��) BC 2,3,6����, ���� 3,6����, �Ｚ 6,9���� ������ : CCBC-02:03:06,CCKM-03:06,CCSS-03:06:04 -->
            <!-- <input type="hidden" name="kcp_noint_quota" value="CCBC-02:03:06,CCKM-03:06,CCSS-03:06:09"/> --> 
            
            <!-- KCP�� ������ǰ�� �������ǰ�� ���ÿ� �Ǹ��ϴ� ��ü���� ���������� ���� ���Ǽ��� �����ص帮����, 
               ���հ��� ���� ����Ʈ�ڵ带 ������ �帮�� �� �ݾ׿� ���� ���հ��� ó���� �����ϵ��� �����ϰ� �ֽ��ϴ�
               ���հ��� ���� ����Ʈ �ڵ�� ����Ͻ� ���������� �ش��� �˴ϴ�
               ��ǰ���� �ƴ϶� �ݾ����� �����Ͽ� ��û�ϼž� �մϴ�
               �Ѱ��� �ݾ��� �����ݾ� + �ΰ��� + ������ݾ��� �հ� ���ƾ� �մϴ�. 
               (good_mny = comm_tax_mny + comm_vat_mny + comm_free_mny)
            -->
            <!-- <input type="hidden" name="tax_flag"       value="TG03"> -->  <!-- ����Ұ�    -->
            <!-- <input type="hidden" name="comm_tax_mny"   value=""    > -->  <!-- �����ݾ�    --> 
            <!-- <input type="hidden" name="comm_vat_mny"   value=""    > -->  <!-- �ΰ���     -->
            <!-- <input type="hidden" name="comm_free_mny"  value=""    > -->  <!-- ����� �ݾ� --> 
            
                
            <!-- ����â �ѱ���/���� ���� �ɼ� (Y : ����) -->
            <!-- <input type="hidden" name="eng_flag"        value="Y"/> -->                      
                  
            <!-- ���������� �����ϴ� �� ���̵� ������ �ؾ� �մϴ�. ��ǰ�� ���� �� �ݵ�� �Է��Ͻñ� �ٶ��ϴ�. -->
            <!-- <input type="hidden" name="shop_user_id"    value=""/> --> 
            
            <!-- ��������Ʈ ������ �������� �Ҵ�Ǿ��� �ڵ� ���� �Է��ؾ��մϴ�. -->
            <!-- <input type="hidden" name="pt_memcorp_cd"   value=""/> --> 
                
            <!-- ����â ���ݿ����� ���� ���� �ɼ� (Y : ����) -->
            <!-- <input type="hidden" name="disp_tax_yn"     value="Y"/> -->
        </form>
    </div>
    <form name="pay_form" method="post" action="../kcp_api_pay.jsp">
        <input type="hidden" name="req_tx"         value="<%=req_tx%>" />               <!-- ��û ����          -->
        <input type="hidden" name="res_cd"         value="<%=res_cd%>" />               <!-- ��� �ڵ�          -->
        <input type="hidden" name="site_cd"        value="<%=site_cd%>" />              <!-- ����Ʈ �ڵ�      -->
        <input type="hidden" name="tran_cd"        value="<%=tran_cd%>" />              <!-- Ʈ����� �ڵ�      -->
        <input type="hidden" name="ordr_idxx"      value="<%=ordr_idxx%>" />            <!-- �ֹ���ȣ           -->
        <input type="hidden" name="good_mny"       value="<%=good_mny%>" />             <!-- �޴��� �����ݾ�    -->
        <input type="hidden" name="good_name"      value="<%=good_name%>" />            <!-- ��ǰ��             -->
        <input type="hidden" name="buyr_name"      value="<%=buyr_name%>" />            <!-- �ֹ��ڸ�           -->
        <input type="hidden" name="buyr_tel1"      value="<%=buyr_tel1%>" />            <!-- �ֹ��� ��ȭ��ȣ    -->
        <input type="hidden" name="buyr_tel2"      value="<%=buyr_tel2%>" />            <!-- �ֹ��� �޴�����ȣ  -->
        <input type="hidden" name="buyr_mail"      value="<%=buyr_mail%>" />            <!-- �ֹ��� E-mail      -->
        <input type="hidden" name="enc_info"       value="<%=enc_info%>" />
        <input type="hidden" name="enc_data"       value="<%=enc_data%>" />
        <input type="hidden" name="use_pay_method" value="<%=use_pay_method%>" />
        <input type="hidden" name="cash_yn"        value="<%=cash_yn%>" />              <!-- ���ݿ����� ��Ͽ���-->
        <input type="hidden" name="cash_tr_code"   value="<%=cash_tr_code%>" />
        <!-- �߰� �Ķ���� -->
        <input type="hidden" name="param_opt_1"    value="<%=param_opt_1%>" />
        <input type="hidden" name="param_opt_2"    value="<%=param_opt_2%>" />
        <input type="hidden" name="param_opt_3"    value="<%=param_opt_3%>" />
    </form>
<!--//wrap-->
</body>
</html>