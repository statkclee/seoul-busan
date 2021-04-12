# http://elecinfo.nec.go.kr/neweps/common/download.do?svc_path_nm=/epdata/EP17/ECM2017/01/ECM0120170006&epid=ECM0120170006&start_file_sn=0012
# http://elecinfo.nec.go.kr/neweps/common/download.do?svc_path_nm=/epdata/EP17/ECM2017/01/ECM0120170006&epid=ECM0120170006&start_file_sn=0012
# http://elecinfo.nec.go.kr/neweps/common/download.do?svc_path_nm=/epdata/EP17/ECM2017/01/ECM0120170006&epid=ECM0120170006&start_file_sn=0004


download.file("http://elecinfo.nec.go.kr/neweps/common/download.do?svc_path_nm=/epdata/EP17/ECM2017/01/ECM0120170006&epid=ECM0120170006&start_file_sn=0012",
              destfile = "data/test.pdf", mode = "wb")

poster_url <- "http://elecinfo.nec.go.kr/neweps/3/1/paperSearch.do?chs=&page=&epType=&start_file_sn=&end_file_sn=&svc_path_nm=&epid=&candidate_nm=&elect_ymd=&epdata_id=&ctl_no_id=&elect_sn=&party_nm=&win_yn=&elecDe=&turnDe=%B4%EB%C5%EB%B7%C9%BC%B1%B0%C5&elecType=10&code_id=10++&elecTypeMax=20&turnType=EPS0410++&cityType=EPS041019&guType=&sign_id=19&sido_nm=&elect_region_nm=&fieldName=candidate_nm&category=tms120tbl&myScraps=&kwd=&elecTypes=10&electionType=on&electionTurn=on&pageSize=20&order=elect_ymd&order_sort=desc"

poster_html <- poster_url %>% 
    read_html()

poster_buttons <- poster_html %>% 
    html_nodes(xpath = '//*[@id="content"]/div[5]/ul') %>% 
    html_nodes(css = "a") %>% 
    html_attr("href")

pdf_files <- poster_buttons[str_detect(poster_buttons, pattern = "start_file")] 

pdf_poster_files <- pdf_files[str_detect(pdf_files, pattern = "ECM0120170006")]    

glue::glue("http://elecinfo.nec.go.kr{pdf_poster_files}")
