<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApplicationPreview.aspx.cs" Inherits="Bhusamadhan.LandDispute.Entry.ApplicationPreview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .application-header {
            padding: 15px 0;
            text-align: center;
        }

            .application-header h3 {
                margin: 0 0 5px;
                font-weight: 700;
            }

            .application-header h5 {
                margin: 0;
                font-weight: 600;
            }


        /* Application Number */
        .application-number {
            padding: 8px 15px;
            margin-top: 10px;
            text-align: right;
            font-weight: 600;
        }


        .preview-section {
            margin-bottom: 20px;
        }

        .section-title {
            background-color: #d8d8d8;
            padding: 8px 15px;
            margin: 0;
            min-height: 38px;
            font-size: 18px;
            font-weight: 600;
            line-height: 22px;
            border: 1px solid #c8c8c8;
        }



        .preview-field {
            padding: 7px 15px;
            line-height: 1.5;
        }

        .preview-label {
            display: inline-block;
            font-weight: 600;
            color: #333;
        }

        .preview-value {
            display: inline-block;
            margin-left: 5px;
            color: #555;
            word-break: break-word;
        }


        /* Label and Value in Bootstrap row */
        .preview-label-block {
            font-weight: 600;
            color: #333;
        }

        .preview-value-block {
            color: #555;
            word-break: break-word;
        }



        .vadi-card {
            margin: 15px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow: hidden;
            background-color: #fff;
        }

        .vadi-header {
            padding: 8px 15px;
            background-color: #f1f1f1;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
            font-weight: 600;
        }

        .vadi-body {
            padding: 5px 0;
        }



        .preview-table {
            width: 100%;
            margin-bottom: 0;
            border-collapse: collapse;
        }

            .preview-table th {
                padding: 8px;
                text-align: center;
                vertical-align: middle;
                font-weight: 600;
                white-space: normal;
            }

            .preview-table td {
                padding: 8px;
                vertical-align: top;
                word-break: break-word;
            }



        .CSSTableGeneratorGrid {
            width: 100%;
            margin-bottom: 0;
        }

            .CSSTableGeneratorGrid th {
                text-align: center;
                vertical-align: middle;
                font-weight: 600;
                white-space: normal;
            }

            .CSSTableGeneratorGrid td {
                vertical-align: top;
                word-break: break-word;
            }


        /* Long text inside GridView */
        .preview-grid-text {
            display: block;
            max-height: 60px;
            overflow-y: auto;
            overflow-x: hidden;
            line-height: 1.4;
            word-break: break-word;
        }

        .getpdfdoc,
        .evidence-pdf,
        .preview-pdf {
            cursor: pointer;
            border: 0;
        }

        .pdf-link {
            display: inline-block;
            cursor: pointer;
        }

        .pdf-icon {
            width: 40px;
            height: 40px;
            cursor: pointer;
        }


        .document-field {
            padding: 8px 15px;
        }

            .document-field img {
                vertical-align: middle;
            }


        .preview-actions {
            margin-top: 25px;
            padding: 15px;
            text-align: center;
            border-top: 1px solid #ddd;
        }

            .preview-actions .btn {
                min-width: 150px;
                margin: 0 5px 5px;
            }



        .preview-value-highlight {
            font-weight: 600;
        }



        @media (max-width: 767px) {

            .section-title {
                font-size: 16px;
                padding: 8px 10px;
            }

            .preview-field {
                padding: 6px 10px;
            }

            .preview-label,
            .preview-value {
                display: block;
                margin-left: 0;
            }

            .application-number {
                text-align: left;
            }

            .preview-actions .btn {
                width: 100%;
                margin: 5px 0;
            }

            .CSSTableGeneratorGrid {
                font-size: 12px;
            }

                .CSSTableGeneratorGrid th,
                .CSSTableGeneratorGrid td {
                    padding: 6px;
                }
        }
    </style>


    <script>
        function openPrintPage() {

            var applicationId = new URLSearchParams(window.location.search).get('a_id');

            if (!applicationId || applicationId === '0') {
                alert('Application not found.');
                return false;
            }

            var url = 'ApplicationPrint.aspx?a_id=' + encodeURIComponent(applicationId);

            window.open(url, '_blank');

            return false;
        }

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH" runat="server">

    <div class="container-fluid">
        <div class="application-header">
            <h3>भू-समाधान</h3>
            <h5>गृह विभाग, बिहार सरकार</h5>
        </div>

        <div class="card">

            <div class="card-body">

                <!-- Application Details -->
                <div class="section-title">
                    आवेदन विवरण
   
                </div>

                <div class="row align-items-center mb-3">

                    <div class="col-md-8">
                        <span class="form-label">आवेदन संख्या :</span>

                        <asp:Label ID="lblApplicationNo" runat="server" CssClass="preview-label"> </asp:Label>
                    </div>

                    <div class="col-md-4">
                        <span class="form-label">आवेदन तिथि :</span>

                        <asp:Label ID="lblAppDate" runat="server" CssClass="preview-label"> </asp:Label>

                        <asp:HiddenField ID="lbla_id" runat="server" />
                    </div>

                </div>


                <!-- Vadi Details -->
                <div class="section-title">
                    <%--//--ok--%>
                    वादी का विवरण
                </div>

                <asp:Repeater ID="rptVadi" runat="server">

                    <HeaderTemplate>
                        <div class="vadi-list">
                    </HeaderTemplate>

                    <ItemTemplate>

                        <div class="vadi-card">

                            <!-- Vadi Header -->
                            <div class="vadi-header">
                                वादी <%# Container.ItemIndex + 1 %>
                            </div>

                            <div class="row">


                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">वादी का नाम :</span>
                                    <span class="preview-value">
                                        <%# Eval("NameAsPerAadhaar") %>
                                    </span>
                                </div>


                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">पिता/पति का नाम :</span>
                                    <span class="preview-value">
                                        <%# Eval("Vadi_Father_Husband_Name") %>
                                    </span>
                                </div>


                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">लिंग :</span>
                                    <span class="preview-value">
                                        <%# Convert.ToString(Eval("SexAsPerAadhaar")) == "F" ? "महिला" : "पुरुष" %>
                                    </span>
                                </div>

                            </div>

                            <div class="row">


                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">जन्म वर्ष :</span>
                                    <span class="preview-value">
                                        <%# Eval("YearOfBirthAsPerAadhaar") %>
                                    </span>
                                </div>


                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">मोबाइल संख्या :</span>
                                    <span class="preview-value">
                                        <%# Eval("Vadi_MobileNo") %>
                                    </span>
                                </div>


                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">क्षेत्र का प्रकार :</span>
                                    <span class="preview-value">
                                        <%# Eval("area_type") %>
                                    </span>
                                </div>

                            </div>

                            <div class="row">


                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">जिला :</span>
                                    <span class="preview-value">
                                        <%# Eval("dist") %>
                                    </span>
                                </div>


                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">अनुमंडल :</span>
                                    <span class="preview-value">
                                        <%# Eval("sub_division") %>
                                    </span>
                                </div>


                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">अंचल :</span>
                                    <span class="preview-value">
                                        <%# Eval("block") %>
                                    </span>
                                </div>

                            </div>

                            <div class="row">


                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">थाना :</span>
                                    <span class="preview-value">
                                        <%# Eval("thana") %>
                                    </span>
                                </div>


                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">ग्राम पंचायत :</span>
                                    <span class="preview-value">
                                        <%# Eval("panchayt") %>
                                    </span>
                                </div>


                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">राजस्व ग्राम :</span>
                                    <span class="preview-value">
                                        <%# Eval("village") %>
                                    </span>
                                </div>

                            </div>

                            <div class="row">

                                <!-- Ward -->
                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">वार्ड :</span>
                                    <span class="preview-value">
                                        <%# Eval("WardNo") %>
                                    </span>
                                </div>


                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">विभाग का प्रतिनिधि :</span>
                                    <span class="preview-value">
                                        <%-- <%# Convert.ToString(Eval("is_vadi_from_an_dept")) == "Y"  ? "हां" : "नहीं" %>--%>
                                        <%# Convert.ToString(Eval("IsDepartmentRepresentative")) == "Y"  ? "हां" : "नहीं" %>
                                    </span>
                                </div>

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">संस्था का प्रतिनिधि :</span>
                                    <span class="preview-value">
                                        <%-- <%# Convert.ToString(Eval("is_vadi_from_an_org")) == "Y"  ? "हां" : "नहीं" %>--%>
                                        <%# Convert.ToString(Eval("IsOrganizationRepresentative")) == "Y"  ? "हां" : "नहीं" %>
                                    </span>
                                </div>

                            </div>

                            <div class="row">


                                <div class="col-md-6 preview-field">
                                    <span class="preview-label">विभाग/संस्था का नाम :</span>
                                    <span class="preview-value">
                                        <%--  <%# Convert.ToString(Eval("is_vadi_from_an_org")) == "Y" ? Eval("vadi_org_name") : Eval("org_type") %>--%>
                                        <%# Convert.ToString(Eval("IsOrganizationRepresentative")) == "Y" ? Eval("DepartmentOrganizationName") : Eval("org_type") %>
                                    </span>
                                </div>


                                <div class="col-md-6 preview-field">
                                    <span class="preview-label">विभाग/संस्था में पदनाम :</span>
                                    <span class="preview-value">
                                        <%-- <%# Convert.ToString(Eval("is_vadi_from_an_org")) == "Y"  ? Eval("vadi_org_pad_name")  : Eval("vadi_dept_pad_name") %>--%>
                                        <%# Convert.ToString(Eval("DepartmentOrganizationName")) == "Y"  ? Eval("DepartmentOrganizationPost")  : Eval("DepartmentOrganizationPost") %>
                                    </span>
                                </div>

                            </div>

                        </div>

                    </ItemTemplate>

                    <FooterTemplate>
                        </div>
                    </FooterTemplate>

                </asp:Repeater>



                <!-- Land Dispute Details -->
                <%--//--ok--%>
                <div class="section-title">
                    भूमि विवाद का विवरण
                </div>

                <div class="preview-section">

                    <!-- Location Details -->
                    <div class="row">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">जिला :</span>
                            <asp:Label ID="lblDistrict" runat="server" CssClass="preview-value" />
                        </div>

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">अनुमंडल :</span>
                            <asp:Label ID="lblSubdivision" runat="server" CssClass="preview-value" />
                        </div>

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">अंचल :</span>
                            <asp:Label ID="lblBlock" runat="server" CssClass="preview-value" />
                        </div>

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">थाना :</span>
                            <asp:Label ID="lblPolice_Station" runat="server" CssClass="preview-value" />
                        </div>

                    </div>



                    <div class="row">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">क्षेत्र का प्रकार :</span>
                            <asp:Label ID="lblAreaType" runat="server" CssClass="preview-value" />
                        </div>

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">ग्राम पंचायत :</span>
                            <asp:Label ID="lblPanchayatName" runat="server" CssClass="preview-value" />
                        </div>

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">राजस्व ग्राम :</span>
                        </div>

                        <div class="col-md-3 preview-field">
                            <asp:Label ID="lblVILLNAME" runat="server" CssClass="preview-value" />
                        </div>

                    </div>


                    <div class="row">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">वार्ड :</span>
                            <asp:Label ID="lblWARDNAME" runat="server" CssClass="preview-value" />
                        </div>

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">विवाद का अद्यतन कारक :</span>
                            <asp:Label ID="lblvadi_Vivad_Ka_AadyatanKaran" runat="server" CssClass="preview-value" />
                        </div>

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">राजस्व थाना संख्या :</span>
                            <asp:Label ID="lblvadi_rajashv_sankhaya" runat="server" CssClass="preview-value" />
                        </div>

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">भूमि का प्रकार :</span>
                            <asp:Label ID="lblVadi_BhumiKaPrakar" runat="server" CssClass="preview-value" />
                        </div>

                    </div>


                    <!-- Government Land Details -->
                    <div class="row">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">सरकारी भूमि का प्रकार :</span>
                        </div>

                        <div class="col-md-3 preview-field">
                            <asp:Label ID="lblvadi_sarkari_bhumi_ka_prakar" runat="server" CssClass="preview-value" />
                        </div>

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">सरकारी भूमि का प्रकार (अगर अन्य है) :  </span>
                        </div>

                        <div class="col-md-3 preview-field">
                            <asp:Label ID="lblvadi_Sarkari_bhumi_ka_Prakar_ager_anya" runat="server" CssClass="preview-value" />
                        </div>

                    </div>


                    <!-- Land Dispute Type -->
                    <div class="row">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">भूमि विवाद का प्रकार :</span>

                            <asp:Label ID="lblBhumiKa_VivadPrakar" runat="server" CssClass="preview-value" />
                        </div>

                        <div class="col-md-3 preview-field">

                            <span class="preview-label">भूमि विवाद का प्रकार (अगर अन्य है) : </span>

                        </div>

                        <div class="col-md-3 preview-field" id="div_Preview_vadi_Bhumivivad_Prakar_Anaya" runat="server">

                            <asp:Label ID="lblvadi_Bhumivivad_Prakar_Anaya" runat="server" CssClass="preview-value" />

                        </div>

                    </div>


                    <!-- Vadi's Description -->
                    <div class="row">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">वादी द्वारा भूमि विवाद का संक्षिप्त विवरण : </span>
                        </div>

                        <div class="col-md-9 preview-field">

                            <asp:Label ID="lblVadiKabhumiVivaran" runat="server" CssClass="preview-value" />

                        </div>

                    </div>


                    <!-- Prativadi's Description -->
                    <div class="row">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">प्रतिवादी द्वारा भूमि विवाद का संक्षिप्त विवरण : </span>
                        </div>

                        <div class="col-md-9 preview-field">

                            <asp:Label ID="lblPrativadiKabhumiVivaran" runat="server" CssClass="preview-value" />

                        </div>

                    </div>



                    <div class="row">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">वादी द्वारा प्रस्तुत आवेदन : </span>
                        </div>

                        <div class="col-md-9 preview-field" id="div29" runat="server">

                            <asp:ImageButton ID="lnkAppDoc" runat="server" ImageUrl="~/images/pdf.gif" Width="40px" Height="40px" CssClass="getpdfdoc" />

                        </div>

                    </div>



                    <div class="row">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">प्रतिवादी द्वारा प्रस्तुत आवेदन :  </span>
                        </div>

                        <div class="col-md-9 preview-field" id="div30" runat="server">

                            <asp:ImageButton ID="lnkPrativadiDoc" runat="server" ImageUrl="~/images/pdf.gif" Width="40px" Height="40px" CssClass="getpdfdoc" />

                        </div>

                    </div>

                </div>


                <!--
                    Step 3 Information  Will be added here
                -->
                <!-- Pratiwadi Details -->
                <div class="section-title">
                    <%--ok--%>
                    प्रतिवादी का विवरण
                </div>

                <asp:Repeater ID="rptPratiwadi" runat="server">

                    <HeaderTemplate>
                        <div class="pratiwadi-list">
                    </HeaderTemplate>

                    <ItemTemplate>

                        <div class="pratiwadi-card">

                            <!-- Pratiwadi Header -->
                            <div class="pratiwadi-header">
                                प्रतिवादी <%# Container.ItemIndex + 1 %>
                            </div>

                            <!-- Basic Details -->
                            <div class="row">

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">प्रतिवादी का नाम :</span>
                                    <span class="preview-value">
                                        <%# Eval("pratiVadi_Name") %>
                                    </span>
                                </div>

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">पिता/पति का नाम :</span>
                                    <span class="preview-value">
                                        <%# Eval("pratiVadi_Father_Husband_Name") %>
                                    </span>
                                </div>

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">मोबाइल संख्या :</span>
                                    <span class="preview-value">
                                        <%# Eval("pratiVadi_MobileNo") %>
                                    </span>
                                </div>

                            </div>

                            <!-- Location Details -->
                            <div class="row">

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">जिला :</span>
                                    <span class="preview-value">
                                        <%# Eval("dist") %>
                                    </span>
                                </div>

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">अनुमंडल :</span>
                                    <span class="preview-value">
                                        <%# Eval("sub_division") %>
                                    </span>
                                </div>

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">अंचल :</span>
                                    <span class="preview-value">
                                        <%# Eval("block") %>
                                    </span>
                                </div>

                            </div>

                            <!-- Area Details -->
                            <div class="row">

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">थाना :</span>
                                    <span class="preview-value">
                                        <%# Eval("thana") %>
                                    </span>
                                </div>

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">क्षेत्र का प्रकार :</span>
                                    <span class="preview-value">
                                        <%# Eval("area_type") %>
                                    </span>
                                </div>

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">ग्राम पंचायत :</span>
                                    <span class="preview-value">
                                        <%# Eval("panchayt") %>
                                    </span>
                                </div>

                            </div>

                            <!-- Village / Ward -->
                            <div class="row">

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">राजस्व ग्राम :</span>
                                    <span class="preview-value">
                                        <%# Eval("village") %>
                                    </span>
                                </div>

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">वार्ड :</span>
                                    <span class="preview-value">
                                        <%# Eval("WardNo") %>
                                    </span>
                                </div>

                            </div>

                            <!-- Representative Details -->
                            <div class="row">

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">संस्था का प्रतिनिधि :</span>
                                    <span class="preview-value">
                                        <%-- <%# Convert.ToString(Eval("is_pratiVadi_from_an_org")) == "Y" ? "हां" : "नहीं" %>--%>
                                        <%# Convert.ToString(Eval("IsOrganizationRepresentative")) == "Y" ? "हां" : "नहीं" %>
                                    </span>
                                </div>

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">विभाग का प्रतिनिधि :</span>
                                    <span class="preview-value">
                                        <%--  <%# Convert.ToString(Eval("is_pratiVadi_from_an_dept")) == "Y"  ? "हां"  : "नहीं" %>--%>
                                        <%# Convert.ToString(Eval("IsDepartmentRepresentative")) == "Y"  ? "हां"  : "नहीं" %>
                                    </span>
                                </div>

                            </div>

                            <!-- Department / Organization Details -->
                            <div class="row">

                                <div class="col-md-6 preview-field">
                                    <span class="preview-label">विभाग/संस्था का नाम :</span>
                                    <span class="preview-value">
                                        <%-- <%# Convert.ToString(Eval("is_pratiVadi_from_an_org")) == "Y"  ? Eval("pratiVadi_org_name") : Eval("org_type") %>--%>
                                        <%# Convert.ToString(Eval("IsOrganizationRepresentative")) == "Y"  ? Eval("DepartmentOrganizationName") : Eval("DepartmentOrganizationName") %>
                                    </span>
                                </div>

                                <div class="col-md-6 preview-field">
                                    <span class="preview-label">विभाग/संस्था में पदनाम :</span>
                                    <span class="preview-value">
                                        <%--<%# Convert.ToString(Eval("is_pratiVadi_from_an_org")) == "Y" ? Eval("pratiVadi_org_pad_name"): Eval("pratiVadi_dept_pad_name") %>--%>
                                        <%# Convert.ToString(Eval("IsOrganizationRepresentative")) == "Y" ? Eval("DepartmentOrganizationPost"): Eval("DepartmentOrganizationPost") %>
                                    </span>
                                </div>

                            </div>

                        </div>

                    </ItemTemplate>

                    <FooterTemplate>
                        </div>
                    </FooterTemplate>

                </asp:Repeater>

                <!-- Step 4 Information Will be added here -->

                <!-- Other Details -->
                <div class="section-title">
                    <%--ok--%>
                    अन्य विवरण
                </div>

                <div class="preview-section">

                    <div class="row">

                        <div class="col-md-6 preview-field">
                            <span class="preview-label">प्रतिवादी को सूचित किया गया है या नहीं ? </span>

                            <asp:Label ID="lblprativadi_ka_suchit" runat="server" CssClass="preview-value" />
                        </div>

                        <!-- Reason -->
                        <div class="col-md-6 preview-field">
                            <span class="preview-label">कारण स्पष्ट करें : </span>

                            <asp:Label ID="lblprativadi_ka_Karan" runat="server" CssClass="preview-value" />
                        </div>

                    </div>


                    <div class="row">

                        <!-- Medium -->
                        <div class="col-md-6 preview-field">
                            <span class="preview-label">माध्यम :  </span>

                            <asp:Label ID="lblprativadi_ka_madham" runat="server" CssClass="preview-value" />
                        </div>

                        <!-- Notice Received -->
                        <div class="col-md-6 preview-field">
                            <span class="preview-label">प्रतिवादी को सूचना तामिला प्राप्त है या नहीं ?  </span>

                            <asp:Label ID="lblprativadi_ka_SuchnaTamil" runat="server" CssClass="preview-value" />
                        </div>

                    </div>


                    <div class="row">

                        <!-- Pratiwadi Present -->
                        <div class="col-md-6 preview-field">
                            <span class="preview-label">प्रतिवादी उपस्थित हुआ है या नहीं ?  </span>

                            <asp:Label ID="lblprativadi_ka_Upashtith" runat="server" CssClass="preview-value" />
                        </div>

                    </div>

                </div>
                <!--
                    Step 5 Information Will be added here
                -->
                <!-- Land Khata-Khesra Details -->
                <div class="section-title">
                    <%--ok--%>
                    भूमि का खाता-खेसरा का विवरण
                </div>

                <asp:Repeater ID="rptBhumiKhataKhesra" runat="server">

                    <HeaderTemplate>
                        <div class="khata-khesra-list">
                    </HeaderTemplate>

                    <ItemTemplate>

                        <div class="person-card">

                            <!-- Record Header -->
                            <div class="person-header">
                                भूमि विवरण <%# Container.ItemIndex + 1 %>
                            </div>

                            <!-- Khata / Khesra / Rakba -->
                            <div class="row">

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">खाता संख्या :
                                    </span>

                                    <span class="preview-value">
                                        <%# Eval("khataNo") %>
                                    </span>
                                </div>

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">खेसरा संख्या :
                                    </span>

                                    <span class="preview-value">
                                        <%# Eval("khesraNo") %>
                                    </span>
                                </div>

                                <div class="col-md-4 preview-field">
                                    <span class="preview-label">रकबा :
                                    </span>

                                    <span class="preview-value">
                                        <%# Eval("Rakba") %>
                                    </span>
                                </div>

                            </div>

                            <!-- Land Type -->
                            <div class="row">

                                <div class="col-md-6 preview-field">
                                    <span class="preview-label">जमीन की किस्म :
                                    </span>

                                    <span class="preview-value">
                                        <%# Eval("LandTypesInKhatianDesc") %>
                                    </span>
                                </div>

                            </div>

                            <!-- Khatian Land Details -->
                            <div class="row">

                                <div class="col-md-12 preview-field">
                                    <span class="preview-label">खतियान में जमीन का विवरण :
                                    </span>

                                    <div class="preview-long-text">
                                        <%# Eval("LandDetailsInKhatian") %>
                                    </div>
                                </div>

                            </div>

                            <!-- Chauhaddee -->
                            <div class="row">

                                <div class="col-md-3 preview-field">
                                    <span class="preview-label">उत्तर :
                                    </span>

                                    <span class="preview-value">
                                        <%# Eval("North_chauhaddee") %>
                                    </span>
                                </div>

                                <div class="col-md-3 preview-field">
                                    <span class="preview-label">दक्षिण :
                                    </span>

                                    <span class="preview-value">
                                        <%# Eval("South_chauhaddee") %>
                                    </span>
                                </div>

                                <div class="col-md-3 preview-field">
                                    <span class="preview-label">पूर्व :
                                    </span>

                                    <span class="preview-value">
                                        <%# Eval("East_chauhaddee") %>
                                    </span>
                                </div>

                                <div class="col-md-3 preview-field">
                                    <span class="preview-label">पश्चिम :
                                    </span>

                                    <span class="preview-value">
                                        <%# Eval("West_chauhaddee") %>
                                    </span>
                                </div>

                            </div>

                        </div>

                    </ItemTemplate>

                    <FooterTemplate>
                        </div>
                    </FooterTemplate>

                </asp:Repeater>

                <!--
                    Step 6 Information  Will be added here
                -->

                <div class="section-title">
                    <%--ok--%>
                    वादी द्वारा प्रस्तुत साक्ष्य का विवरण
                </div>

                <%-- rptVadiEvidence--%>


                <asp:Repeater ID="rptVadiEvidence" runat="server" OnItemCommand="rptVadiEvidence_ItemCommand">

                    <HeaderTemplate>
                        <div class="evidence-list">
                    </HeaderTemplate>

                    <ItemTemplate>

                        <div class="evidence-card">


                            <div class="evidence-number">
                                साक्ष्य <%# Container.ItemIndex + 1 %>
                            </div>

                            <div class="row align-items-center">

                                <div class="col-md-8 preview-field">

                                    <span class="preview-label">साक्ष्य का प्रकार : </span>

                                    <span class="preview-value">
                                        <%# Convert.ToString(Eval("evidence_id")) != "9" ? Eval("evidence_name")  : Eval("evidence_any_name") %>
                                    </span>

                                </div>


                                <div class="col-md-4 preview-field">

                                    <span class="preview-label">साक्ष्य का दस्तावेज : </span>

                                    <asp:ImageButton ID="imgVadiEvidence" runat="server" ImageUrl="~/images/pdf.gif" Width="40px" Height="40px" CssClass="evidence-pdf" CommandArgument='<%# Eval("FullfileName") %>' CommandName="View" Visible='<%# !string.IsNullOrWhiteSpace(Convert.ToString(Eval("FullfileName"))) %>' />

                                </div>

                            </div>

                        </div>

                    </ItemTemplate>

                    <FooterTemplate>
                        </div>
                    </FooterTemplate>

                </asp:Repeater>

                <!--
                    Step 7 Information Will be added here

                    <!-- Pratiwadi Evidence Details -->
                <div class="section-title">
                    <%--ok--%>
                    प्रतिवादी द्वारा प्रस्तुत साक्ष्य का विवरण
                </div>

                <asp:Repeater ID="rptPratiwadiEvidence" runat="server" OnItemCommand="rptPratiwadiEvidence_ItemCommand">

                    <HeaderTemplate>
                        <div class="evidence-list">
                    </HeaderTemplate>

                    <ItemTemplate>

                        <div class="evidence-card">

                            <!-- Evidence Number -->
                            <div class="evidence-number">
                                साक्ष्य <%# Container.ItemIndex + 1 %>
                            </div>

                            <div class="row align-items-center">


                                <div class="col-md-8 preview-field">

                                    <span class="preview-label">साक्ष्य का प्रकार : </span>

                                    <span class="preview-value">
                                        <%# Convert.ToString(Eval("evidence_id")) != "9" ? Eval("evidence_name") : Eval("evidence_any_name") %>
                                    </span>

                                </div>


                                <div class="col-md-4 preview-field">

                                    <span class="preview-label">साक्ष्य का दस्तावेज :  </span>

                                    <asp:ImageButton ID="imgPratiwadiEvidence" runat="server" ImageUrl="~/images/pdf.gif" Width="40px" Height="40px" CssClass="evidence-pdf" CommandArgument='<%# Eval("FullfileName") %>' CommandName="View" Visible='<%# !string.IsNullOrWhiteSpace(Convert.ToString(Eval("FullfileName"))) %>' />

                                </div>

                            </div>

                        </div>

                    </ItemTemplate>

                    <FooterTemplate>
                        </div>
                    </FooterTemplate>

                </asp:Repeater>

                <!-- Revenue / Police / Halka Employee Details -->
                <%--ok--%>
                <div class="section-title">
                    राजस्व अधिकारी / पुलिस पदाधिकारी / हल्का कर्मचारी द्वारा प्रस्तुत साक्ष्य का विवरण
                </div>

                <div class="preview-section">

                    <!-- Police Officer Report -->
                    <div class="row">

                        <div class="col-md-4 preview-field">
                            <span class="preview-label">पुलिस पदाधिकारी द्वारा समर्पित जाँच प्रतिवेदन की संक्षिप्त विवरणी :  </span>
                        </div>

                        <div class="col-md-8 preview-field">
                            <asp:Label ID="lblPoliceAdhikariVivarni" runat="server" CssClass="preview-value" />
                        </div>

                    </div>


                    <!-- Halka Karmchari / Revenue Officer Report -->
                    <div class="row">

                        <div class="col-md-4 preview-field">
                            <span class="preview-label">हल्का कर्मचारी / राजस्व अधिकारी द्वारा समर्पित जाँच प्रतिवेदन की संक्षिप्त विवरणी : </span>
                        </div>

                        <div class="col-md-8 preview-field">
                            <asp:Label ID="lblHalkaKarmchariVivarni" runat="server" CssClass="preview-value" />
                        </div>

                    </div>


                    <!-- Disputed Land Measurement -->
                    <div class="row">

                        <div class="col-md-4 preview-field">
                            <span class="preview-label">विवादित भू-खंड की मापी : </span>
                        </div>

                        <div class="col-md-8 preview-field">
                            <asp:Label ID="lblVivaditBhukandKiMapiKaReasonHai" runat="server" CssClass="preview-value" />
                        </div>

                    </div>


                    <!-- Measurement Status -->
                    <div class="row">

                        <div class="col-md-4 preview-field">
                            <span class="preview-label">मापी : </span>
                        </div>

                        <div class="col-md-8 preview-field">
                            <asp:Label ID="lblMapiValue" runat="server" CssClass="preview-value" />
                        </div>

                    </div>


                    <!-- Reason for No Measurement -->
                    <div class="row">

                        <div class="col-md-4 preview-field">
                            <span class="preview-label">विवादित भू-खंड की मापी नहीं होने का कारण :  </span>
                        </div>

                        <div class="col-md-8 preview-field">
                            <asp:Label ID="lblVivaditBhumiKaMapiNahiHoneKaKaran" runat="server" CssClass="preview-value" />
                        </div>

                    </div>


                    <!-- Scheduled Measurement Date -->
                    <div class="row">

                        <div class="col-md-4 preview-field">
                            <span class="preview-label">मापी के लिए निर्धारित तिथि :  </span>
                        </div>

                        <div class="col-md-8 preview-field">
                            <asp:Label ID="lblMapiKeNirdharnKiThithiValue" runat="server" CssClass="preview-value" />
                        </div>

                    </div>


                    <%--  //-------------------------------------------------%>
                    <div class="document-section">

                        <div class="document-title">
                            संबंधित दस्तावेज
                        </div>


                        <!-- Police Report Document -->
                        <div class="row document-row">

                            <div class="col-md-8 preview-field">
                                <span class="preview-label">पुलिस पदाधिकारी द्वारा समर्पित जाँच प्रतिवेदन का दस्तावेज :  </span>
                            </div>

                            <div class="col-md-4 preview-field">

                                <asp:ImageButton ID="lnkpulis_padadhikari_Patr_file" runat="server" ImageUrl="~/images/pdf.gif" Width="40px" Height="40px" CssClass="evidence-pdf" CommandName="View" />

                            </div>

                        </div>

                        <div class="row document-row">

                            <div class="col-md-8 preview-field">
                                <span class="preview-label">हल्का कर्मचारी / राजस्व अधिकारी द्वारा समर्पित जाँच प्रतिवेदन का दस्तावेज : </span>
                            </div>

                            <div class="col-md-4 preview-field">

                                <asp:ImageButton ID="lnkfile_halkakarmchari_praptr" runat="server" ImageUrl="~/images/pdf.gif" Width="40px" Height="40px" CssClass="evidence-pdf" CommandName="View" />

                            </div>

                        </div>


                        <div class="row document-row">

                            <div class="col-md-8 preview-field">
                                <span class="preview-label">विवादित भू-खंड की मापी का प्रतिवेदन : </span>
                            </div>

                            <div class="col-md-4 preview-field">

                                <asp:ImageButton ID="lnkfile_bhukand_prativedan" runat="server" ImageUrl="~/images/pdf.gif" Width="40px" Height="40px" CssClass="evidence-pdf" CommandName="View" />

                            </div>

                        </div>

                    </div>

                </div>

                <%--  //-------------------------------------------------%>

                <!-- Land Dispute Incident Details -->
                <%--ok--%>
                <div class="section-title">
                    भूमि विवाद से संबंधित घटना / वारदात का विवरण
                </div>

                <div class="preview-section">

                    <!-- FIR / Complaint / Sanha Status -->
                    <div class="row">

                        <div class="col-md-6 preview-field">

                            <span class="preview-label">प्राथमिकी / अप्राथमिकी / सनहा दर्ज है ? </span>

                            <asp:Label ID="lblPrathamikHai" runat="server" CssClass="preview-value" />

                        </div>

                    </div>


                    <!-- Incident Records -->
                    <asp:Repeater ID="rptBhumiVivAdIncident" runat="server">

                        <HeaderTemplate>
                            <div class="incident-list">
                        </HeaderTemplate>

                        <ItemTemplate>

                            <div class="incident-card">

                                <!-- Incident Header -->
                                <div class="incident-header">
                                    घटना / वारदात <%# Container.ItemIndex + 1 %>
                                </div>


                                <!-- Date and Short Description -->
                                <div class="row">

                                    <div class="col-md-4 preview-field">

                                        <span class="preview-label">घटना की तिथि : </span>

                                        <span class="preview-value">
                                            <%# Eval("Ghatna_Vardat_date") %>
                                        </span>

                                    </div>

                                    <div class="col-md-8 preview-field">

                                        <span class="preview-label">घटना की संक्षिप्त विवरण :
                                        </span>

                                        <div class="preview-long-text">
                                            <%# Eval("Ghatna_Short_vivran") %>
                                        </div>

                                    </div>

                                </div>


                                <!-- FIR Details -->
                                <div class="sub-section-title">
                                    प्राथमिकी का विवरण
                                </div>

                                <div class="row">

                                    <div class="col-md-4 preview-field">

                                        <span class="preview-label">प्राथमिकी दर्ज : </span>

                                        <span class="preview-value">
                                            <%# Eval("is_FIR_registered") %>
                                        </span>

                                    </div>

                                    <div class="col-md-4 preview-field">

                                        <span class="preview-label">प्राथमिकी संख्या : </span>

                                        <span class="preview-value">
                                            <%# Eval("praathamiki_sankhya") %>
                                        </span>

                                    </div>

                                    <div class="col-md-12 preview-field">

                                        <span class="preview-label">प्राथमिकी का विवरण : </span>

                                        <div class="preview-long-text">
                                            <%# Eval("praathamiki_ka_vivaran") %>
                                        </div>

                                    </div>

                                </div>


                                <!-- Applicable Sections -->
                                <div class="sub-section-title">
                                    धाराओं का विवरण
                                </div>

                                <div class="row">

                                    <div class="col-md-3 preview-field">

                                        <span class="preview-label">धारा : </span>

                                        <span class="preview-value">
                                            <%# Eval("dhaara") %>
                                        </span>

                                    </div>

                                    <div class="col-md-3 preview-field">

                                        <span class="preview-label">BNS :  </span>

                                        <span class="preview-value">
                                            <%# Eval("bns") %>
                                        </span>

                                    </div>

                                    <div class="col-md-3 preview-field">

                                        <span class="preview-label">IPC धारा : </span>

                                        <span class="preview-value">
                                            <%# Eval("dhaaranew") %>
                                        </span>

                                    </div>

                                    <div class="col-md-3 preview-field">

                                        <span class="preview-label">BNS अन्य : </span>

                                        <span class="preview-value">
                                            <%# Eval("bns_oth") %>
                                        </span>

                                    </div>

                                </div>

                                <div class="row">

                                    <div class="col-md-6 preview-field">

                                        <span class="preview-label">IPC अन्य :
                                        </span>

                                        <span class="preview-value">
                                            <%# Eval("dhaara_oth") %>
                                        </span>

                                    </div>

                                </div>


                                <!-- Aprathmiki Details -->
                                <div class="sub-section-title">
                                    अप्राथमिकी का विवरण
                                </div>

                                <div class="row">

                                    <div class="col-md-4 preview-field">

                                        <span class="preview-label">अप्राथमिकी दर्ज :   </span>

                                        <span class="preview-value">
                                            <%# Eval("is_complaint_filed") %>
                                        </span>

                                    </div>

                                    <div class="col-md-4 preview-field">

                                        <span class="preview-label">अप्राथमिकी संख्या :  </span>

                                        <span class="preview-value">
                                            <%# Eval("apraathamiki_sankhya") %>
                                        </span>

                                    </div>

                                    <div class="col-md-12 preview-field">

                                        <span class="preview-label">अप्राथमिकी का विवरण :   </span>

                                        <div class="preview-long-text">
                                            <%# Eval("apraathamiki_ka_vivaran") %>
                                        </div>

                                    </div>

                                </div>


                                <!-- Sanha Details -->
                                <div class="sub-section-title">
                                    सनहा का विवरण
                                </div>

                                <div class="row">

                                    <div class="col-md-4 preview-field">

                                        <span class="preview-label">सनहा दर्ज :   </span>

                                        <span class="preview-value">
                                            <%# Eval("is_Sanha_recorded") %>
                                        </span>

                                    </div>

                                    <div class="col-md-4 preview-field">

                                        <span class="preview-label">सनहा संख्या :  </span>

                                        <span class="preview-value">
                                            <%# Eval("sanha_sankhya") %>
                                        </span>

                                    </div>

                                    <div class="col-md-12 preview-field">

                                        <span class="preview-label">अभियुक्ति :  </span>

                                        <div class="preview-long-text">
                                            <%# Eval("Abhiyukt") %>
                                        </div>

                                    </div>

                                </div>

                            </div>

                        </ItemTemplate>

                        <FooterTemplate>
                            </div>
                        </FooterTemplate>

                    </asp:Repeater>

                </div>
                <%--  //-------------------------------------------------%>

                <div class="section-title">
                    <%--ok--%>
                    न्यायालय में प्रक्रियाधीन वाद का विवरण
                </div>

                <div class="preview-section">

                    <!-- Availability -->
                    <div class="row">

                        <div class="col-md-6 preview-field">

                            <span class="preview-label">प्रक्रियाधीन वाद का विवरण उपलब्ध है ?
                            </span>

                            <asp:Label ID="lblPrakiriyadhinVadAvailable" runat="server" CssClass="preview-value" />

                        </div>

                    </div>


                    <!-- Court Case Details -->
                    <asp:Repeater ID="rptNyayalayVivran" runat="server">

                        <HeaderTemplate>
                            <div class="court-case-list">
                        </HeaderTemplate>

                        <ItemTemplate>

                            <div class="court-case-card">


                                <div class="court-case-header">प्रक्रियाधीन वाद <%# Container.ItemIndex + 1 %>  </div>


                                <div class="sub-section-title">न्यायालय का विवरण </div>

                                <div class="row">

                                    <div class="col-md-4 preview-field">

                                        <span class="preview-label">न्यायालय : </span>

                                        <span class="preview-value">
                                            <%# Eval("court") %>
                                        </span>

                                    </div>

                                    <div class="col-md-4 preview-field">

                                        <span class="preview-label">न्यायालय का प्रकार :  </span>

                                        <span class="preview-value">
                                            <%# Eval("courtType") %>
                                        </span>

                                    </div>

                                    <div class="col-md-4 preview-field">

                                        <span class="preview-label">विभाग :  </span>

                                        <span class="preview-value">
                                            <%# Eval("Vibhag") %>
                                        </span>

                                    </div>

                                </div>


                                <!-- Location -->
                                <div class="row">

                                    <div class="col-md-6 preview-field">

                                        <span class="preview-label">जिला :   </span>

                                        <span class="preview-value">
                                            <%# Eval("Dst") %>
                                        </span>

                                    </div>

                                    <div class="col-md-6 preview-field">

                                        <span class="preview-label">अनुमंडल :  </span>

                                        <span class="preview-value">
                                            <%# Eval("SubDiv") %>
                                        </span>

                                    </div>

                                </div>


                                <!-- Case Number -->
                                <div class="row">

                                    <div class="col-md-6 preview-field">

                                        <span class="preview-label">वाद संख्या / वर्ष :   </span>

                                        <span class="preview-value">
                                            <%# Eval("vaadi_ki_vaad_sankhya_varsh") %>
                                        </span>

                                    </div>

                                </div>


                                <!-- Parties -->
                                <div class="sub-section-title">
                                    पक्षकारों का विवरण
                                </div>

                                <div class="row">

                                    <div class="col-md-6 preview-field">

                                        <span class="preview-label">वादी का नाम :  </span>

                                        <span class="preview-value">
                                            <%# Eval("vadi_name") %>
                                        </span>

                                    </div>

                                    <div class="col-md-6 preview-field">

                                        <span class="preview-label">प्रतिवादी का नाम :  </span>

                                        <span class="preview-value">
                                            <%# Eval("prativadi_name") %>
                                        </span>

                                    </div>

                                </div>


                                <!-- Current Status -->
                                <div class="row">

                                    <div class="col-md-12 preview-field">

                                        <span class="preview-label">अद्यतन स्थिति का विवरण :  </span>

                                        <div class="preview-long-text">
                                            <%# Eval("vaad_ki_addhatan_sthiti_vivaran") %>
                                        </div>

                                    </div>

                                </div>

                            </div>

                        </ItemTemplate>

                        <FooterTemplate>
                            </div>
                        </FooterTemplate>

                    </asp:Repeater>

                </div>

                <%--  //-------------------------------------------------%>

                <div class="section-title">
                    अंचलाधिकारी एवं थानाध्यक्ष द्वारा भूमि विवाद के निराकरण हेतु कृत कारवाई का विवरण
                </div>

                <div class="preview-section">


                    <div class="row">

                        <div class="col-md-6 preview-field">
                            <span class="preview-label">विवाद की संवेदनशीलता : </span>

                            <asp:Label ID="lblVivaadKiSanvedanasheelata" runat="server" CssClass="preview-value" />
                        </div>

                        <div class="col-md-6 preview-field">
                            <span class="preview-label">बैठक की तिथि :  </span>

                            <asp:Label ID="lblBaithakKiTithi" runat="server" CssClass="preview-value" />
                        </div>

                    </div>



                    <div class="row">

                        <div class="col-md-6 preview-field">
                            <span class="preview-label">क्या वादी उपस्थित है ? </span>

                            <asp:Label ID="lblkyaVaadeeUpasthitHai" runat="server" CssClass="preview-value" />
                        </div>

                        <div class="col-md-6 preview-field">
                            <span class="preview-label">क्या प्रतिवादी उपस्थित है ? </span>

                            <asp:Label ID="lblKyaPrativaadeeUpasthitHai" runat="server" CssClass="preview-value" />
                        </div>

                    </div>



                    <div class="row">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">बैठक का निष्कर्ष : </span>
                        </div>

                        <div class="col-md-9 preview-field">
                            <asp:Label ID="lblBaithakKaNishkarsh" runat="server" CssClass="preview-value preview-long-text" />
                        </div>

                    </div>


                    <div class="row">

                        <div class="row" id="divtithi" runat="server">

                            <asp:Label ID="lbltithi" runat="server" CssClass="preview-label" />

                            <asp:Label ID="lbltithivalue" runat="server" CssClass="preview-value" />

                        </div>

                    </div>


                    <div class="row" id="divAsveekrtiKaKaaranLabel" runat="server">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">अस्वीकृति का कारण :  </span>
                        </div>

                        <div class="col-md-9 preview-field">

                            <asp:Label ID="lblAsveekrtiKaKaaran" runat="server" CssClass="preview-value preview-long-text" />

                        </div>

                    </div>


                    <div class="row" id="divvadikavarsh" runat="server">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">वादी की वाद संख्या / वर्ष : </span>
                        </div>

                        <div class="col-md-9 preview-field">

                            <asp:Label ID="lblvadikaVadSankhyaVarsh" runat="server" CssClass="preview-value" />

                        </div>

                    </div>



                    <div class="row">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">बैठक में लिया गया निर्णय :  </span>
                        </div>

                        <div class="col-md-9 preview-field">

                            <asp:Label ID="lblBaithakMeinLiyaGayaNirnay" runat="server" CssClass="preview-value preview-long-text" />

                        </div>

                    </div>

                    <div class="row">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">अंचलाधिकारी का मंतव्य :  </span>
                        </div>

                        <div class="col-md-9 preview-field">

                            <asp:Label ID="lblAnchalaadhikaareeKaMantavy" runat="server" CssClass="preview-value preview-long-text" />

                        </div>

                    </div>

                    <div class="row">

                        <div class="col-md-3 preview-field">
                            <span class="preview-label">थानाध्यक्ष का मंतव्य :  </span>
                        </div>

                        <div class="col-md-9 preview-field">

                            <asp:Label ID="lblThaanaadhyakshKaMantavy" runat="server" CssClass="preview-value preview-long-text" />

                        </div>

                    </div>


                    <!-- Documents -->
                    <div class="preview-documents">

                        <!-- संयुक्त प्रतिवेदन -->
                        <div class="row">

                            <div class="col-md-4 preview-field">
                                <span class="preview-label">थानाध्यक्ष एवं अंचलाधिकारी का संयुक्त प्रतिवेदन : </span>
                            </div>

                            <div class="col-md-8 preview-field">

                                <asp:ImageButton ID="lnkJointDoc__letterOfIntent" runat="server" ImageUrl="~/images/pdf.gif" Width="45px" Height="45px" CssClass="preview-pdf" CommandArgument='<%# Eval("FullfileName") %>' ToolTip="संयुक्त प्रतिवेदन देखें" />

                            </div>

                        </div>


                        <div class="row">

                            <div class="col-md-4 preview-field">
                                <span class="preview-label">अंचलाधिकारी का मंतव्य पत्र :   </span>
                            </div>

                            <div class="col-md-8 preview-field">

                                <asp:ImageButton ID="lnkCircleOfficer_letterOfIntent" runat="server" ImageUrl="~/images/pdf.gif" Width="45px" Height="45px" CssClass="preview-pdf" CommandArgument='<%# Eval("FullfileName") %>' ToolTip="अंचलाधिकारी का मंतव्य पत्र देखें" />

                            </div>

                        </div>


                        <div class="row">

                            <div class="col-md-4 preview-field">
                                <span class="preview-label">थानाध्यक्ष का मंतव्य : </span>
                            </div>

                            <div class="col-md-8 preview-field">

                                <asp:ImageButton ID="lnkPoliceOfficer_letterOfIntent" runat="server" ImageUrl="~/images/pdf.gif" Width="45px" Height="45px" CssClass="preview-pdf" CommandArgument='<%# Eval("FullfileName") %>' ToolTip="थानाध्यक्ष का मंतव्य देखें" />

                            </div>

                        </div>

                    </div>

                </div>


                <div class="preview-actions">

                    <asp:Button ID="btnEdit" runat="server" Text="Edit Application" CssClass="btn btn-warning" OnClick="btnEdit_Click" />

                    <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn btn-primary" OnClientClick="return openPrintPage();" />

                    <asp:Button ID="btnFinalSubmit" runat="server" Text="Final Submit" CssClass="btn btn-success" OnClientClick="return confirm('After Final Submit, application cannot be edited.\nDo you want to continue?');" OnClick="btnFinalSubmit_Click" />

                </div>

            </div>

        </div>



    </div>
</asp:Content>
