<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Checkout.aspx.vb" Inherits="Web.Checkout"
    MasterPageFile="~/Pages/Store.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="bodyContent" runat="server">
    <div id="checkoutForm" runat="server" class="well">
        <h2>Checkout Now</h2>
        Please enter your details, and we'll ship your goods right away!

        <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />

        <fieldset>
            <legend>Ship to</legend>

            <div class="form-group">
                <label class="col-lg-2 control-label">Name</label>
                <div class="col-lg-10">
                    <input id="name" name="name" class="form-control" />
                </div>
            </div>
        </fieldset>

        <fieldset>
            <legend>Address</legend>

            <div class="form-group">
                <label class="col-lg-2 control-label">Line 1:</label>
                <div class="col-lg-10">
                    <input id="line1" name="line1" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">Line 2:</label>
                <div class="col-lg-10">
                    <input id="line2" name="line2" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">Line 3:</label>
                <div class="col-lg-10">
                    <input id="line3" name="line3" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">City:</label>
                <div class="col-lg-10">
                    <input id="city" name="city" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-2 control-label">State:</label>
                <div class="col-lg-10">
                    <input id="state" name="state" class="form-control" />
                </div>
            </div>
        </fieldset>

        <fieldset>
            <legend>Options</legend>

            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="giftwrap" name="giftwrap" value="true" />
                            Gift wrap these items?
                        </label>
                    </div>
                </div>
            </div>
        </fieldset>

        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-10">
                <button type="submit" class="btn btn-success">Complete Order</button>
            </div>
        </div>
    </div>

    <div id="checkoutMessage" runat="server" class="alert alert-success">
        <h2>Thanks!</h2>
        Thanks for placing your order. We'll ship your goods as soon as possible.
    </div>
</asp:Content>
