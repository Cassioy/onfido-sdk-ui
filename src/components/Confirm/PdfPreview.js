import { h, Component } from 'preact'
import PDFObject from 'pdfobject'
import {preventDefaultOnClick} from '../utils'
import style from './style.css'

const IEPdfBlobLink = ({blob}) => {
  const downloadPDF = (e) => {
    window.navigator.msSaveOrOpenBlob(blob, 'document.pdf')
  }
  return <a href='#'
    onClick={preventDefaultOnClick(downloadPDF)}
    className={style.pdfIcon}
  />
}

let i = 0

class PDFPreview extends Component {
  constructor(props){
    super(props)
    this.id = 'pdfContainer' + (i++)
  }
  options = {
    width: '92%',
    height: '290px',
    'max-height': '70vh',
    border: 0,
    fallbackLink: `<a href='[url]' class=${style.pdfIcon} download/>`
  }

  embedPDF(previewUrl){
    PDFObject.embed(previewUrl, `#${this.id}`, this.options);
  }

  componentDidMount() {
    const { previewUrl } = this.props;
    this.embedPDF(previewUrl)
  }
  shouldComponentUpdate (nextProps, nextState) {
    return false;
  }
  componentWillReceiveProps({previewUrl}) {
    if (this.props.pdfPreview !== previewUrl) this.embedPDF(previewUrl)
  }
  render() {
    return <div id={this.id} />;
  }
}

class PdfViewer extends Component {
  shouldComponentUpdate (nextProps, nextState) {
    return false;
  }

  render() {
    const { blob, previewUrl } = this.props;
    return (
      <div>
        {window.navigator.msSaveOrOpenBlob ?
          <IEPdfBlobLink blob={blob} /> :
          <PDFPreview previewUrl={previewUrl}/>
        }
      </div>
    )
  }
}
export default PdfViewer